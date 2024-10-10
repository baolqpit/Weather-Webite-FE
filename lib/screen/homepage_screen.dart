import 'package:flutter/material.dart';
import 'package:weather_forecast_website/screen/weather_management_screen.dart';
import 'package:weather_forecast_website/share/colors/app_color.dart';
import 'package:weather_forecast_website/share/dimens/dimens.dart';
import 'package:weather_forecast_website/share/widgets/app_text.dart';
import 'package:weather_forecast_website/share/widgets/custom_nav_bar.dart';

class HomepageScreen extends StatefulWidget {
  const HomepageScreen({super.key});

  @override
  State<HomepageScreen> createState() => _HomepageScreenState();
}

class _HomepageScreenState extends State<HomepageScreen> {
  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomNavBar(title: 'Weather Dashboard'),
        body: Padding(
          padding: const EdgeInsets.symmetric(
              vertical: Dimens.padding_horizontal,
              horizontal: Dimens.padding_24),
          child: _buildWeatherManagement(),
        ));
  }

  _buildWeatherManagement() {
    return const WeatherManagementScreen();
  }
}
