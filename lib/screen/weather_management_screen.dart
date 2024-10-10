import 'package:flutter/material.dart';
import 'package:weather_forecast_website/screen/city_section.dart';
import 'package:weather_forecast_website/screen/dashboard_section.dart';

import '../share/dimens/dimens.dart';

class WeatherManagementScreen extends StatefulWidget {
  const WeatherManagementScreen({super.key});

  @override
  State<WeatherManagementScreen> createState() =>
      _WeatherManagementScreenState();
}

class _WeatherManagementScreenState extends State<WeatherManagementScreen> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(child: _buildCitySection(), flex: 2,),
        Dimens.width20,
        Expanded(child: _buildDashboardSection(), flex: 3,)
      ],
    );
  }

  _buildCitySection() {
    return const CitySection();
  }

  _buildDashboardSection() {
    return const DashboardSection();
  }
}
