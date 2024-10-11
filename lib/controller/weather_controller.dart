import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:weather_forecast_website/controller/web_controller.dart';
import 'package:weather_forecast_website/models/weather_model.dart';
import 'package:weather_forecast_website/share/widgets/dialog.dart';

class WeatherController extends GetxController {
  final WebController webController = Get.find();
  final _apiUrl = "http://api.weatherapi.com/v1/";
  final _baseUrl = "http://localhost:8000/api/";
  final Dio _dio = Dio();

  Rx<WeatherModel?> currentWeather = Rx<WeatherModel?>(null);

  ///GET CURRENT WEATHER DATA
  getCurrentWeatherData({required BuildContext context, required String city}) async {
    webController.isLoading.value = true;
    String? _apiKey = dotenv.env['WEATHER_API_KEY'];

    if (_apiKey == null || _apiKey.isEmpty) {
      showErrorDialog(context: context, content: 'Invalid API Key');
      webController.isLoading.value = false;
      return;
    }

    Map<String, dynamic> params = {
      'key': _apiKey,
      'q': city,
      'aqi': 'no'
    };

    try {
      var response = await _dio.get('${_apiUrl}current.json',
          queryParameters: params,
          options: Options(contentType: 'application/json'));
      webController.isLoading.value = false;
      currentWeather.value = WeatherModel.fromJson(response.data);
      return response.data;
    } on DioException catch (e) {
      if (e.response != null) {
        webController.isLoading.value = false;
        showErrorDialog(context: context, content: "${e.response!.statusCode}: ${e.response!.data}");
      } else {
        webController.isLoading.value = false;
        showErrorDialog(context: context, content: 'Server Error!');
      }
    }
  }

  ///FORECAST 4 DAYS LATER AND MORE
  ///STORE WEATHER DATA
  storeWeatherData () async {
    webController.isLoading.value = true;

    Map<String, dynamic> data = {
      'name': currentWeather.value!.name,
      'localtime': currentWeather.value!.localtime,
      'icon': currentWeather.value!.icon,
      'humidity': currentWeather.value!.humidity,
      'tempC': currentWeather.value!.tempC,
      'tempF': currentWeather.value!.tempF,
      'windMph': currentWeather.value!.windMph,
      'windKph': currentWeather.value!.windKph,
      'windDegree': currentWeather.value!.windDegree,
    };

    try {
      var response = await _dio.post('${_baseUrl}store-weather-current',
          data: data,
          options: Options(contentType: 'application/x-www-form-urlencoded'));
      webController.isLoading.value = false;
      showSuccessDialog(context: Get.context!, content: 'Save Current Weather Successfully!');
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
}