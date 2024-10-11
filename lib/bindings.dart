import 'package:get/get.dart';
import 'package:weather_forecast_website/controller/weather_controller.dart';

import 'controller/user_controller.dart';


class InitialBinding implements Bindings {
  @override
  void dependencies() {
    print('Initial Controller');
    Get.put<UserController>(UserController());
    Get.put<WeatherController>(WeatherController());
    // TODO: implement dependencies
  }

}