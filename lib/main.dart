import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_forecast_website/controller/web_controller.dart';
import 'package:weather_forecast_website/screen/homepage_screen.dart';
import 'bindings.dart';

void main() {
  runApp(const MainScreen());
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  WebController webController = Get.put<WebController>(WebController());

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: InitialBinding(),
      home: const HomepageScreen(),
    );
  }
}