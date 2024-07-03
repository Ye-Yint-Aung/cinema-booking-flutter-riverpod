import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../application/services/http_provider.dart';
import '../../application/services/http_service.dart';
import '../../domail/state/api_state.dart';

abstract class MusicRepository {
  Future<dynamic> fetchMusic(String endPoint,{Map<String, dynamic>? params,Object? body});
}

class MusicRepositoryImpl implements MusicRepository {
  late final HttpService _httpService;
  MusicRepositoryImpl(this._httpService);
  @override
  Future<ApiState> fetchMusic(String endPoint,{Map<String, dynamic>? params, Object? body}) async {
    final response = await _httpService.get(endPoint,queryParameters: params,body: body);
    return response;
  }
}

final musicRepositoryProvider = Provider<MusicRepositoryImpl>((ref) {
  final httpService = ref.watch(httpProvider);

  return MusicRepositoryImpl(httpService);
});
