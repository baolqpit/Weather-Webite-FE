import 'package:flutter/material.dart';
import 'package:weather_forecast_website/share/colors/app_color.dart';
import 'package:weather_forecast_website/share/dimens/dimens.dart';
import 'package:weather_forecast_website/share/widgets/app_text.dart';

class DashboardSection extends StatefulWidget {
  const DashboardSection({super.key});

  @override
  State<DashboardSection> createState() => _DashboardSectionState();
}

class _DashboardSectionState extends State<DashboardSection> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        _buildCurrentWeather(),
        Dimens.height20,
        _buildForecastWeather()
      ],
    );
  }

  _buildCurrentWeather() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
          vertical: Dimens.padding_vertical,
          horizontal: Dimens.padding_horizontal),
      decoration: BoxDecoration(
        color: AppColor.primary,
        borderRadius: BorderRadius.circular(Dimens.sizeValue5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          AppText(
            content: 'London (10/10/2024)',
            color: AppColor.white,
            fontWeight: FontWeight.bold,
            textSize: Dimens.font_size_title,
          ),
          Dimens.height20,
          AppText(
            content: 'Temperature: ',
            color: AppColor.white,
          ),
          Dimens.height5,
          AppText(
            content: 'Wind: ',
            color: AppColor.white,
          ),
          Dimens.height5,
          AppText(
            content: 'Humidity: ',
            color: AppColor.white,
          )
        ],
      ),
    );
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
              onPressed: () {},
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
                onPressed: () {},
                child: AppText(
                  content: 'Forecast More',
                )),
          ],
        ),
        Dimens.height20,
        Row(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.symmetric(
                  horizontal: Dimens.padding_horizontal,
                  vertical: Dimens.padding_vertical),
              decoration: _buildBoxDecoration(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  AppText(
                    content: '11/10/2024',
                    fontWeight: FontWeight.bold,
                    color: AppColor.white,
                  ),
                  Dimens.height10,
                  AppText(
                    content: 'Temp: ',
                    color: AppColor.white,
                  ),
                  Dimens.height5,
                  AppText(
                    content: 'Wind: ',
                    color: AppColor.white,
                  ),
                  Dimens.height5,
                  AppText(
                    content: 'Humidity: ',
                    color: AppColor.white,
                  ),
                ],
              ),
            ),
            Dimens.width10,
            Container(
              padding: const EdgeInsets.symmetric(
                  horizontal: Dimens.padding_horizontal,
                  vertical: Dimens.padding_vertical),
              decoration: _buildBoxDecoration(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  AppText(
                    content: '11/10/2024',
                    fontWeight: FontWeight.bold,
                    color: AppColor.white,
                  ),
                  Dimens.height10,
                  AppText(
                    content: 'Temp: ',
                    color: AppColor.white,
                  ),
                  Dimens.height5,
                  AppText(
                    content: 'Wind: ',
                    color: AppColor.white,
                  ),
                  Dimens.height5,
                  AppText(
                    content: 'Humidity: ',
                    color: AppColor.white,
                  ),
                ],
              ),
            ),
            Dimens.width10,
            Container(
              padding: const EdgeInsets.symmetric(
                  horizontal: Dimens.padding_horizontal,
                  vertical: Dimens.padding_vertical),
              decoration: _buildBoxDecoration(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  AppText(
                    content: '11/10/2024',
                    fontWeight: FontWeight.bold,
                    color: AppColor.white,
                  ),
                  Dimens.height10,
                  AppText(
                    content: 'Temp: ',
                    color: AppColor.white,
                  ),
                  Dimens.height5,
                  AppText(
                    content: 'Wind: ',
                    color: AppColor.white,
                  ),
                  Dimens.height5,
                  AppText(
                    content: 'Humidity: ',
                    color: AppColor.white,
                  ),
                ],
              ),
            ),
            Dimens.width10,
            Container(
              padding: const EdgeInsets.symmetric(
                  horizontal: Dimens.padding_horizontal,
                  vertical: Dimens.padding_vertical),
              decoration: _buildBoxDecoration(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  AppText(
                    content: '11/10/2024',
                    fontWeight: FontWeight.bold,
                    color: AppColor.white,
                  ),
                  Dimens.height10,
                  AppText(
                    content: 'Temp: ',
                    color: AppColor.white,
                  ),
                  Dimens.height5,
                  AppText(
                    content: 'Wind: ',
                    color: AppColor.white,
                  ),
                  Dimens.height5,
                  AppText(
                    content: 'Humidity: ',
                    color: AppColor.white,
                  ),
                ],
              ),
            ),
            Dimens.width10,
          ],
        )
      ],
    );
  }

  _buildBoxDecoration() {
    return BoxDecoration(
        color: Colors.black54,
        borderRadius: BorderRadius.circular(Dimens.circular5));
  }
}
