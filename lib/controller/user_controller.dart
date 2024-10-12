import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:weather_forecast_website/controller/web_controller.dart';
import 'package:weather_forecast_website/share/widgets/dialog.dart';

class UserController extends GetxController {
  final Dio _dio = Dio();
  final _baseUrl = "https://weather-web-backend.vercel.app/api/api/";

  final WebController webController = Get.find();

  ///SEND OTP TO EMAIL
  sendOTPToEmail({required String email}) async {
    webController.isLoading.value = true;

    Map<String, dynamic> data = {'email': email};

    try {
      var response = await _dio.post('${_baseUrl}send-otp',
          data: data,
          options: Options(contentType: 'application/x-www-form-urlencoded'));
      webController.isLoading.value = false;
      return response.data;
    } on DioException catch (e) {
      if (e.response != null) {
        webController.isLoading.value = false;
        switch (e.response!.statusCode) {
          case 400:
              showWarningDialog(
                  context: Get.context!, content: e.response!.data['message']);
            break;

          case 500:
              showErrorDialog(
                  context: Get.context!,
                  content: 'Server error. Please try again later.');
            break;
          default:
            break;
        }
      }
    }
  }

  ///VERIFY OTP
  verifyOtp(
      {
      required String email,
      required String otp}) async {
    webController.isLoading.value = true;

    Map<String, dynamic> data = {
      'email': email,
      'otp': otp,
    };

    try {
      var response = await _dio.post('${_baseUrl}verify-otp',
          data: data,
          options: Options(contentType: 'application/x-www-form-urlencoded'));
      webController.isLoading.value = false;
      return response.data;
    } on DioException catch (e) {
      if (e.response != null) {
        webController.isLoading.value = false;
          showErrorDialog(
              context: Get.context!,
              content:
              "${e.response!.statusCode} ${e.response!.data['message']}");
      }
    }
  }

  ///UNSUBSCRIBE
  unsubscribe({required String email}) async {
    webController.isLoading.value = true;

    Map<String, dynamic> data = {'email': email};

    try {
      var response = await _dio.post('${_baseUrl}unsubscribe',
          data: data,
          options: Options(contentType: 'application/x-www-form-urlencoded'));
      webController.isLoading.value = false;
      print(response);
      showSuccessDialog(context: Get.context!, content: "Unsubscribe successfully");
      return response.data;
    } on DioException catch (e) {
      if (e.response != null) {
        webController.isLoading.value = false;
        showWarningDialog(context: Get.context!, content: "${e.response!.statusCode}: ${e.response!.statusMessage}");
      }
    }
  }
}
