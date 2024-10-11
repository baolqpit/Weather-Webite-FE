import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_forecast_website/controller/weather_controller.dart';
import 'package:weather_forecast_website/controller/web_controller.dart';
import 'package:weather_forecast_website/models/weather_model.dart';
import 'package:weather_forecast_website/models/weather_model_from_db.dart';
import 'package:weather_forecast_website/share/dimens/dimens.dart';
import 'package:weather_forecast_website/share/format/format.dart';
import 'package:weather_forecast_website/share/widgets/app_text.dart';

class WeatherStoreScreen extends StatefulWidget {
  const WeatherStoreScreen({super.key});

  @override
  State<WeatherStoreScreen> createState() => _WeatherStoreScreenState();
}

class _WeatherStoreScreenState extends State<WeatherStoreScreen> {
  final WebController webController = Get.find();
  final WeatherController weatherController = Get.find();

  @override
  void dispose() {
    // TODO: implement dispose
    weatherController.itemSelected.value = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppText(
              content: 'Saved Date',
              fontWeight: FontWeight.bold,
              textSize: Dimens.font_size_title,
            ),
            DropdownButtonFormField(
                value: weatherController.itemSelected.value,
                decoration: InputDecoration(
                  suffixIcon: weatherController.itemSelected.value == null
                      ? null
                      : IconButton(
                          onPressed: () =>
                              weatherController.itemSelected.value = null,
                          icon: const Icon(Icons.clear)),
                ),
                hint: AppText(content: 'Choose date'),
                items: weatherController.listWeatherStored
                    .map((item) => DropdownMenuItem(
                        value: item, child: AppText(content: convertToLocalTime(utcDateTime: item!.createdAt))))
                    .toList(),
                onChanged: (WeatherModelFromDb? value) {
                  if (value != null) {
                    WeatherModel weatherModel = WeatherModel(
                        name: value!.name,
                        localtime: value!.localtime,
                        icon: value!.icon,
                        humidity: value!.humidity,
                        tempC: value!.tempC,
                        tempF: value!.tempF,
                        windMph: value!.windMph,
                        windKph: value!.windKph,
                        windDegree: value!.windDegree);
                    weatherController.currentWeather.value = weatherModel;
                    weatherController.itemSelected.value = value;
                  }
                }),
          ],
        ));
  }
}
