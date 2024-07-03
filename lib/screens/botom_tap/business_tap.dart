import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_demo/data/repositories/music_repository.dart';
import 'package:riverpod_demo/providers/music/music_provider.dart';
import 'package:riverpod_demo/widgets/music/player_widget.dart';

import '../../domail/state/api_state.dart';

final musicProvider = StateNotifierProvider<MusicProvider, ApiState>((ref) {
  final repository = ref.watch(musicRepositoryProvider);
  return MusicProvider(repository);
});

class BusinessTap extends ConsumerStatefulWidget {
  const BusinessTap({super.key});

  @override
  ConsumerState<BusinessTap> createState() => _BusinessTapState();
}

class _BusinessTapState extends ConsumerState<BusinessTap> {
  late AudioPlayer player = AudioPlayer();

  @override
  void initState() {
    super.initState();
    player.setReleaseMode(ReleaseMode.stop);
  }

  setAudio(String audioUrl) {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      //await player.setSource(AssetSource('audio/song1.mp3'));
      await player.setSourceUrl(audioUrl);
      await player.resume();
    });
  }

  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final musicState = ref.watch(musicProvider);
    if (musicState is SuccessState) {
      print("@@@@@@@@@@@@@@ :${musicState.data["data"][0]["audio"]}");
      return PageView.builder(
        scrollDirection: Axis.vertical,
        //gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1),
        itemCount: musicState.data["data"].length,
        itemBuilder: (context, index) {
          //https://onedrive.live.com/?authkey=%21AJuljHKclPlx51I&cid=344331EE70543117&id=344331EE70543117%21139&parId=root&o=OneUp
          setAudio(musicState.data["data"][index]["audio"]);
          //setAudio("https://onedrive.live.com/?authkey=%21AJuljHKclPlx51I&cid=344331EE70543117&id=344331EE70543117%21139&parId=root&o=OneUp");
          return Stack(
            children: [
              Image.network(
                musicState.data["data"][index]["cover_photo"],
                fit: BoxFit.fitHeight,
              ),
              Positioned(
                top: 50,
                left: 0,
                right: 0,
                child: PlayerWidget(
                  player: player,
                ),
              ),
            ],
          );
        },
      );
    } else if (musicState is LoadingState) {
      return const Center(
        child: Text("Loading"),
      );
    } else if (musicState is ErrorState) {
      return Center(
        child: Text("${musicState.error}"),
      );
    } else {
      return const Center(
        child: Text("Other"),
      );
    }
  }
}
