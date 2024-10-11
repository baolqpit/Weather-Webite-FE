import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_forecast_website/controller/weather_controller.dart';
import 'package:weather_forecast_website/share/colors/app_color.dart';
import 'package:weather_forecast_website/share/dimens/dimens.dart';
import 'package:weather_forecast_website/share/format/format.dart';
import 'package:weather_forecast_website/share/widgets/app_text.dart';

class ForecastSection extends StatefulWidget {
  const ForecastSection({super.key});

  @override
  State<ForecastSection> createState() => _ForecastSectionState();
}

class _ForecastSectionState extends State<ForecastSection> {
  WeatherController weatherController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(() => weatherController.listWeatherForecastDate.isEmpty
        ? const CircularProgressIndicator()
        : ListView(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            children: weatherController.listWeatherForecastDate
                .map((forecast) => Padding(
                  padding: const EdgeInsets.only(bottom: Dimens.sizeValue10),
                  child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: Dimens.padding_horizontal,
                            vertical: Dimens.padding_vertical),
                        decoration: _buildBoxDecoration(),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                AppText(
                                  content:
                                      '${weatherController.currentWeather.value!.name} ${convertToLocalTime(utcDateTime: forecast!.forecastDate)}',
                                  fontWeight: FontWeight.bold,
                                  color: AppColor.white,
                                ),
                                Dimens.height10,
                                AppText(
                                  content: 'Temp: ${forecast.avgTempC}℃',
                                  color: AppColor.white,
                                ),
                                Dimens.height5,
                                AppText(
                                  content: 'Wind: ${forecast.maxWindMph} Mph',
                                  color: AppColor.white,
                                ),
                                Dimens.height5,
                                AppText(
                                  content: 'Humidity: ${forecast.avgHumidity}%',
                                  color: AppColor.white,
                                ),
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
                               forecast.icon,
                                width: 100,
                                height: 100,
                                fit: BoxFit.contain,
                              ),
                            )
                          ],
                        ),
                      ),
                ))
                .toList(),
          ));
  }

  _buildBoxDecoration() {
    return BoxDecoration(
        color: Colors.black54,
        borderRadius: BorderRadius.circular(Dimens.circular5));
  }
}
