/* import 'dart:developer';


import 'package:rxdart/rxdart.dart';

class QueueState {
  static const QueueState empty = QueueState([], 0, [], AudioServiceRepeatMode.none);
  final List<MediaItem> queue;
  final int? queueIndex;
  final List<int>? shuffleIndices;
  final AudioServiceRepeatMode repeatMode;

  const QueueState(this.queue, this.queueIndex, this.shuffleIndices, this.repeatMode);

  bool get hasPrevious =>
      repeatMode != AudioServiceRepeatMode.none || (queueIndex ?? 0) > 0;

  bool get hasNext =>
      repeatMode != AudioServiceRepeatMode.none || (queueIndex ?? 0) + 1 < queue.length;

  List<int> get indices => shuffleIndices ?? List.generate(queue.length, (i) => i);
}

abstract class AudioPlayerHandler implements AudioHandler {
  Stream<QueueState> get queueState;

  Future<void> moveQueueItem(int currentIndex, int nextIndex);

  Stream<Duration?> get streamDuration;

  bool get isPlaying;

  Future<void> updatePodcasts(List<MediaItem> queue);

  Future<void> addPodcastQueueItems(List<MediaItem> mediaItems);

  Future<void> skipToQueuePodcast(int index);

  bool get radioPlaying;

  set playRadio(bool play);
}

class AudioPlayerHandlerImpl extends BaseAudioHandler
    with SeekHandler
    implements AudioPlayerHandler {
  ///
  AudioPlayerHandlerImpl() {
    _init();
  }

  ///
  final _player = AudioPlayer();
  final _playList = ConcatenatingAudioSource(children: []);
  final _podCastPlayList = ConcatenatingAudioSource(children: []);
  final BehaviorSubject<List<MediaItem>> _recentMedia =
      BehaviorSubject<List<MediaItem>>.seeded([]);
  final _mediaExpandoItem = Expando<MediaItem>();

  Future<void> _init() async {
    final session = await AudioSession.instance;
    await session.configure(const AudioSessionConfiguration.speech());

    // mediaItem.whereType<MediaItem>().listen((item) => _recentMedia.add([item]));

    Rx.combineLatest4<int?, List<MediaItem>, bool, List<int>?, MediaItem?>(
        _player.currentIndexStream,
        queue,
        _player.shuffleModeEnabledStream,
        _player.shuffleIndicesStream, (index, queue, shuffleModeEnabled, shuffleIndices) {
      final queueIndex = getQueueIndex(index, shuffleModeEnabled, shuffleIndices);

      return (queueIndex != null && queueIndex < queue.length) ? queue[queueIndex] : null;
    }).whereType<MediaItem>().distinct().listen(mediaItem.add);

    _player.playbackEventStream.listen(_broadcastState);
    _player.shuffleModeEnabledStream
        .listen((enabled) => _broadcastState(_player.playbackEvent));

    _player.processingStateStream.listen((state) {
      if (state == ProcessingState.completed) {
        stop();
        _player.seek(Duration.zero, index: 0);
      }
    });

    _player.durationStream.listen((duration) {
      final modifiedMediaItem = mediaItem.value?.copyWith(duration: duration);
      mediaItem.add(modifiedMediaItem);
    });

    _effectiveSequence
        .map((sequence) => sequence.map((source) => _mediaExpandoItem[source]!).toList())
        .pipe(queue);
    //
    // _playList.addAll(queue.value.map(_itemToSource).toList());
    // await _player.setAudioSource(_playList);
  }

  AudioSource _itemToSource(MediaItem item) {
    final audioSource = AudioSource.uri(Uri.parse(item.id));
    _mediaExpandoItem[audioSource] = item;
    return audioSource;
  }

  List<AudioSource> _itemsToSources(List<MediaItem> items) =>
      items.map(_itemToSource).toList();

  Stream<List<IndexedAudioSource>> get _effectiveSequence => Rx.combineLatest3<
              List<IndexedAudioSource>?, List<int>?, bool, List<IndexedAudioSource>?>(
          _player.sequenceStream,
          _player.shuffleIndicesStream,
          _player.shuffleModeEnabledStream,
          (sequence, shuffleIndices, shuffleModeEnabled) {
        if (sequence == null) return [];
        if (!shuffleModeEnabled) return sequence;
        if (shuffleIndices == null) return null;
        if (shuffleIndices.length != sequence.length) return null;
        return shuffleIndices.map((i) => sequence[i]).toList();
      }).whereType<List<IndexedAudioSource>>();

  int? getQueueIndex(
      int? currentIndex, bool shuffleModeEnabled, List<int>? shuffleIndices) {
    final effectiveIndices = _player.effectiveIndices ?? [];
    final shuffleIndicesInv = List.filled(effectiveIndices.length, 0);

    for (var i = 0; i < effectiveIndices.length; i++) {
      shuffleIndicesInv[effectiveIndices[i]] = i;
    }
    return (shuffleModeEnabled && ((currentIndex ?? 0) < shuffleIndicesInv.length))
        ? shuffleIndicesInv[currentIndex ?? 0]
        : currentIndex;
  }

  void _broadcastState(PlaybackEvent event) {
    final playing = _player.playing;
    final queueIndex = getQueueIndex(
        event.currentIndex, _player.shuffleModeEnabled, _player.shuffleIndices);

    playbackState.add(
      playbackState.value.copyWith(
        controls: [
          MediaControl.skipToPrevious,
          if (playing) MediaControl.pause else MediaControl.play,
          MediaControl.stop,
          MediaControl.skipToNext
        ],
        androidCompactActionIndices: [0, 1, 3],
        systemActions: {
          MediaAction.seek,
          MediaAction.seekForward,
          MediaAction.seekBackward
        },
        processingState: const {
          ProcessingState.idle: AudioProcessingState.idle,
          ProcessingState.buffering: AudioProcessingState.buffering,
          ProcessingState.loading: AudioProcessingState.loading,
          ProcessingState.ready: AudioProcessingState.ready,
          ProcessingState.completed: AudioProcessingState.completed
        }[_player.processingState]!,
        playing: playing,
        bufferedPosition: _player.bufferedPosition,
        updatePosition: _player.position,
        queueIndex: queueIndex,
        speed: _player.speed,
      ),
    );
  }

  //
  @override
  Future<void> moveQueueItem(int currentIndex, int nextIndex) async {
    await _playList.move(currentIndex, nextIndex);
  }

  @override
  Future<void> updateQueue(List<MediaItem> queue) async {
    if (_playList.children.isNotEmpty) {
      await _playList.clear();
    }
    await _playList.addAll(_itemsToSources(queue));
    await _player.setAudioSource(_playList);
  }

  // Podcast Update Queue
  @override
  Future<void> updatePodcasts(List<MediaItem> queue) async {
    await _podCastPlayList.clear();
    await _podCastPlayList.addAll(_itemsToSources(queue));
    await _player.setAudioSource(_podCastPlayList);
  }

  @override
  Future<void> addQueueItems(List<MediaItem> mediaItems) async {
    await _playList.addAll(_itemsToSources(mediaItems));
    // await _player.setAudioSource(_playList);
  }

  // Podcasts Add Queue Items
  @override
  Future<void> addPodcastQueueItems(List<MediaItem> mediaItems) async {
    await _podCastPlayList.addAll(_itemsToSources(mediaItems));
  }

  @override
  Stream<QueueState> get queueState =>
      Rx.combineLatest3<List<MediaItem>, PlaybackState, List<int>, QueueState>(
          queue,
          playbackState,
          _player.shuffleIndicesStream.whereType<List<int>>(),
          (queue, playbackState, shuffleIndices) => QueueState(
              queue,
              playbackState.queueIndex,
              playbackState.shuffleMode == AudioServiceShuffleMode.all
                  ? shuffleIndices
                  : null,
              playbackState.repeatMode)).where((state) =>
          state.shuffleIndices == null ||
          state.queue.length == state.shuffleIndices!.length);

  @override
  Stream<Duration?> get streamDuration => _player.durationStream;

  @override
  Future<void> skipToNext() => _player.seekToNext();

  @override
  Future<void> skipToPrevious() => _player.seekToPrevious();

  @override
  Future<void> play() => _player.play();

  @override
  Future<void> pause() => _player.pause();

  @override
  Future<void> seek(Duration position) => _player.seek(position);

  @override
  Future<void> skipToQueueItem(int index) async {
    // if (index < 0 || index >= _playList.children.length) return;
    // This jumps to the beginning of the queue item at [index].
    _player.seek(Duration.zero, index: index);
  }

  @override
  Future<void> skipToQueuePodcast(int index) async {
    // if (index < 0 || index >= _podCastPlayList.children.length) return;
    if (_podCastPlayList.children.isNotEmpty && radioPlaying) {
      log("Set source");
      await _player.setAudioSource(_podCastPlayList);
    }
    // This jumps to the beginning of the queue item at [index].
    _player.seek(Duration.zero, index: index);
  }

  @override
  Future<void> stop() async {
    await _player.stop();
    await playbackState
        .firstWhere((state) => state.processingState == AudioProcessingState.idle);
  }

  @override
  bool get isPlaying => _player.playing;

  bool _radioPlaying = false;

  @override
  set playRadio(bool play) {
    _radioPlaying = play;
  }

  @override
  bool get radioPlaying => _radioPlaying;
}
 */