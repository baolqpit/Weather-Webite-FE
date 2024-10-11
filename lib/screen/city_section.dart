import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_forecast_website/controller/user_controller.dart';
import 'package:weather_forecast_website/controller/weather_controller.dart';
import 'package:weather_forecast_website/screen/otp_verify_screen.dart';
import 'package:weather_forecast_website/share/dimens/dimens.dart';
import 'package:weather_forecast_website/share/widgets/app_text.dart';
import 'package:weather_forecast_website/share/widgets/dialog.dart';

import '../share/colors/app_color.dart';

class CitySection extends StatefulWidget {
  const CitySection({super.key});

  @override
  State<CitySection> createState() => _CitySectionState();
}

class _CitySectionState extends State<CitySection> {
  final UserController userController = Get.find();
  final WeatherController weatherController = Get.find();
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController cityTextEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        _buildSubscribeEmail(),
        Dimens.height20,
        _buildCitySearchSection()
      ],
    );
  }

  _buildSubscribeEmail() {
    return Container(
      padding: const EdgeInsets.symmetric(
          vertical: Dimens.padding_horizontal, horizontal: Dimens.padding_24),
      decoration: BoxDecoration(
          border:
              const Border.fromBorderSide(BorderSide(color: AppColor.black)),
          borderRadius: BorderRadius.circular(Dimens.circular5),
          color: AppColor.primary),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppText(
                color: AppColor.white,
                content: 'Enter email',
                fontWeight: FontWeight.bold,
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: Dimens.padding_8),
                decoration: BoxDecoration(
                    border: const Border.fromBorderSide(
                        BorderSide(color: AppColor.white)),
                    borderRadius: BorderRadius.circular(Dimens.circular5)),
                child: TextField(
                  style: const TextStyle(color: AppColor.white),
                  decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'E.g ,. email@gmail.com',
                      hintStyle: TextStyle(color: AppColor.white)),
                  controller: emailTextEditingController,
                ),
              ),
            ],
          )),
          Dimens.width5,
          ElevatedButton(
            onPressed: () async {
              var res = await userController.sendOTPToEmail(email: emailTextEditingController.text);
              if (res != null) {
                showDialog(context: context, builder: (context) {
                  return OtpVerifyScreen(email: emailTextEditingController.text,);
                });
              }
            },
            style: ElevatedButton.styleFrom(backgroundColor: AppColor.red),
            child: AppText(
              content: 'Subscribe',
              color: AppColor.white,
            ),
          )
        ],
      ),
    );
  }

  _buildCitySearchSection() {
    return Container(
      padding: const EdgeInsets.symmetric(
          vertical: Dimens.padding_horizontal, horizontal: Dimens.padding_24),
      decoration: BoxDecoration(
          border:
              const Border.fromBorderSide(BorderSide(color: AppColor.black)),
          borderRadius: BorderRadius.circular(Dimens.circular5),
          color: AppColor.primary),
      child: Column(
        children: <Widget>[
          _buildSearchField(),
          Dimens.height20,
          _buildSearchButton(),
          const Divider(),
          _buildCurrentLocationButton()
        ],
      ),
    );
  }

  _buildSearchField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        AppText(
          content: 'Enter a City Name',
          fontWeight: FontWeight.bold,
          color: AppColor.white,
          textSize: Dimens.font_size_title,
        ),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: Dimens.padding_8),
          decoration: BoxDecoration(
              border: const Border.fromBorderSide(
                  BorderSide(color: AppColor.white)),
              borderRadius: BorderRadius.circular(Dimens.circular5)),
          child: TextField(
            style: const TextStyle(color: AppColor.white),
            controller: cityTextEditingController,
            decoration: const InputDecoration(
              border: InputBorder.none,
              hintStyle: TextStyle(
                color: AppColor.white
              ),
                hintText: 'E.g., London, New York, Tokyo'),
          ),
        ),
      ],
    );
  }

  _buildSearchButton() {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
          onPressed: () async {
            if (cityTextEditingController.text.isEmpty) {
              showWarningDialog(context: context, content: "Enter city");
            } else {
              await weatherController.getCurrentWeatherData(city: cityTextEditingController.text);
              await weatherController.forecastWeather(city: cityTextEditingController.text);
            }
          },
          style: ElevatedButton.styleFrom(backgroundColor: AppColor.red),
          child: AppText(
            content: 'Search',
            color: AppColor.white,
          )),
    );
  }

  _buildCurrentLocationButton() {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
          onPressed: () async {
            await weatherController.getCurrentWeatherData(city: "Ho Chi Minh");
          },
          style: ElevatedButton.styleFrom(backgroundColor: AppColor.grey),
          child: AppText(
            content: 'Use Current Location',
            color: AppColor.white,
          )),
    );
  }
}
