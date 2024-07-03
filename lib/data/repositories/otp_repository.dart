import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../application/services/http_provider.dart';
import '../../application/services/http_service.dart';
import '../../domail/state/api_state.dart';

abstract class OTPRepository {
  Future<dynamic> fetchOTP(String endPoint,{Map<String, dynamic>? params,Object? body});
}

class OTPRepositoryImpl implements OTPRepository {
  late final HttpService _httpService;
  OTPRepositoryImpl(this._httpService);
  @override
  Future<ApiState> fetchOTP(String endPoint,{Map<String, dynamic>? params, Object? body}) async {
    final response = await _httpService.get(endPoint,queryParameters: params,body: body);
    return response;
  }
}

final otpRepositoryProvider = Provider<OTPRepositoryImpl>((ref) {
  final httpService = ref.watch(httpProvider);

  return OTPRepositoryImpl(httpService);
});
