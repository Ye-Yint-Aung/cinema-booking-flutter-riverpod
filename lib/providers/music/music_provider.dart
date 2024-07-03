import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_demo/data/repositories/music_repository.dart';

import '../../domail/state/api_state.dart';

class MusicProvider extends StateNotifier<ApiState> {
  MusicProvider(MusicRepository musicRepo)
      : musicRepository = musicRepo,
        super(InitialState()) {
    fetchMusic();
  }

  late final MusicRepository musicRepository;

  fetchMusic({Map<String, dynamic>? param, Map<String, dynamic>? body}) async {
    state = LoadingState();

    final response = await musicRepository.fetchMusic("https://doob.smartcodemm.com/api/customer/songs");
    print("MUSIC RESPONSE IN PROVIDER###################### $response");

    if (response is SuccessState) {
      print("MUSIC RESPONSE IN PROVIDER###################### ${response.data}");
      final responseData = response.data;
      state = SuccessState(responseData);
    } else if (response is ErrorState) {
      state = ErrorState(response.error, response.errorType);
    } else {
      state = ErrorState('Something wrong', ErrorType.unknown);
    }
  }
}
