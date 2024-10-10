import 'package:weather_forecast_website/api/base_api.dart';

class UserApi extends BaseApi {
  UserApi() : super();
  final SEND_OTP_URL = 'send-otp';

  ///SEND OTP TO EMAIL
  sendOTP({required Map<String, dynamic> data}) {
    return BaseApi().postDataByLaravelRestAPI(url: SEND_OTP_URL, data: data);
  }
}