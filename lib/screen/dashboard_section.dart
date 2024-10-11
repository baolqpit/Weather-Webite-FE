import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_forecast_website/controller/weather_controller.dart';
import 'package:weather_forecast_website/controller/web_controller.dart';
import 'package:weather_forecast_website/screen/forecast_section.dart';
import 'package:weather_forecast_website/screen/weather_store_screen.dart';
import 'package:weather_forecast_website/share/colors/app_color.dart';
import 'package:weather_forecast_website/share/dimens/dimens.dart';
import 'package:weather_forecast_website/share/format/format.dart';
import 'package:weather_forecast_website/share/widgets/app_text.dart';

class DashboardSection extends StatefulWidget {
  const DashboardSection({super.key});

  @override
  State<DashboardSection> createState() => _DashboardSectionState();
}

class _DashboardSectionState extends State<DashboardSection> {
  final WebController webController = Get.find();
  final WeatherController weatherController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        _buildCurrentWeather(),
        Dimens.height20,
        _buildLoadWeatherStore(),
        Dimens.height20,
        _buildForecastWeather(),
        Dimens.height20,
        const Expanded(
          child: ForecastSection(),
        ),
      ],
    );
  }

  _buildCurrentWeather() {
    return Obx(() => weatherController.currentWeather.value == null
        ? const CircularProgressIndicator()
        : Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(
                vertical: Dimens.padding_vertical,
                horizontal: Dimens.padding_horizontal),
            decoration: BoxDecoration(
              color: AppColor.primary,
              borderRadius: BorderRadius.circular(Dimens.sizeValue5),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    AppText(
                      content:
                          "${weatherController.currentWeather.value!.name} (${formatStringToDateTime(datetime: weatherController.currentWeather.value!.localtime!)})",
                      color: AppColor.white,
                      fontWeight: FontWeight.bold,
                      textSize: Dimens.font_size_title,
                    ),
                    Dimens.height20,
                    AppText(
                      content:
                          'Temperature: ${weatherController.currentWeather.value!.tempC}℃',
                      color: AppColor.white,
                    ),
                    Dimens.height5,
                    AppText(
                      content:
                          'Wind: ${weatherController.currentWeather.value!.windMph} Mph',
                      color: AppColor.white,
                    ),
                    Dimens.height5,
                    AppText(
                      content:
                          'Humidity: ${weatherController.currentWeather.value!.humidity}%',
                      color: AppColor.white,
                    )
                  ],
                ),
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10), // Bo góc
                  ),
                  child: Image.network(
                    weatherController.currentWeather.value!.icon,
                    width: 100,
                    height: 100,
                    fit: BoxFit.contain,
                  ),
                )
              ],
            ),
          ));
  }

  _buildLoadWeatherStore() {
    return const WeatherStoreScreen();
  }

  _buildForecastWeather() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        AppText(
            content: '4-day Forecast',
            fontWeight: FontWeight.bold,
            textSize: Dimens.font_size_title),
        Dimens.height10,
        Row(
          children: <Widget>[
            ElevatedButton(
              onPressed: () async {
                await weatherController.storeWeatherData();
                await weatherController.getWeatherStorage();
              },
              style: ElevatedButton.styleFrom(backgroundColor: AppColor.green),
              child: AppText(
                content: 'Save report date',
                color: AppColor.white,
              ),
            ),
            Dimens.width10,
            ElevatedButton(
                style:
                    ElevatedButton.styleFrom(backgroundColor: AppColor.amber),
                onPressed: () {
                  weatherController.forecast4DaysNext(weatherController.listWeatherForecastDate);
                },
                child: AppText(
                  content: 'Forecast More',
                )),
          ],
        ),
        Dimens.height20,
      ],
    );
  }
}
