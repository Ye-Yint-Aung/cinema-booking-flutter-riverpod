import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_demo/domail/state/api_state.dart';

import '../../data/model/otp.dart';
import '../../data/repositories/otp_repository.dart';

class OTPProvider extends StateNotifier<ApiState> {
  OTPProvider(OTPRepository otpRepo)
      : otpRepository = otpRepo,
        super(InitialState());

  late final OTPRepository otpRepository;

  fetchOTP({Map<String, dynamic>? param, Map<String, dynamic>? body}) async {
    state = LoadingState();

    final response = await otpRepository.fetchOTP("http://192.168.20.80:8090/api/users/getOtp");
    print("OTP RESPONSE IN PROVIDER###################### $response");
    final user = OtpObject.fromJson(response.data["data"]);
    return user;
    /* if (response is SuccessState) {
      final responseData = response.data;

      final user = OtpObject.fromJson(responseData);
      print("OTP RESPONSE IN PROVIDER###################### ${user.data!.oTP}");

      state = SuccessState(user);
      // state = responseData["data"]["OTP"];
    } else if (response is ErrorState) {
      state = ErrorState(response.error, response.errorType);
    } else {
      state = ErrorState('Something wrong', ErrorType.unknown);
    } */
  }
}
