import 'dart:async'; // Thêm import này để sử dụng Timer
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:weather_forecast_website/controller/user_controller.dart';

import '../share/colors/app_color.dart';
import '../share/dimens/dimens.dart';
import '../share/widgets/app_text.dart';
import '../share/widgets/dialog.dart';

class OtpVerifyScreen extends StatefulWidget {
  final String email;
  const OtpVerifyScreen({super.key, required this.email});

  @override
  State<OtpVerifyScreen> createState() => _OtpVerifyScreenState();
}

class _OtpVerifyScreenState extends State<OtpVerifyScreen> {
  final UserController userController = Get.find();
  TextEditingController otpEditingController = TextEditingController();
  Timer? _timer;
  int _remainingTime = 300;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_remainingTime > 0) {
        setState(() {
          _remainingTime--;
        });
      } else {
        _timer?.cancel();
      }
    });
  }

  @override
  void dispose() {
    otpEditingController.dispose();
    _timer?.cancel();
    super.dispose();
  }

  String get _formattedTime {
    final minutes = (_remainingTime ~/ 60).toString().padLeft(2, '0');
    final seconds = (_remainingTime % 60).toString().padLeft(2, '0');
    return '$minutes:$seconds';
  }

  @override
  Widget build(BuildContext context) {
    return showAlertDialog(
      title: 'Verify OTP by ${widget.email}',
      context: context,
      onSubmitFunction: () async {
        if (otpEditingController.text.isEmpty) {
          showWarningDialog(context: context, content: "Please fill in otp");
        } else {
          var res = userController.verifyOtp(email: widget.email, otp: otpEditingController.text);
          if (res != null) {
            print(res);
            Get.back();
          }
        }
      },
      widget: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          AppText(content: 'Your OTP will expire in $_formattedTime'),
          AppText(
            content: 'Enter OTP',
            fontWeight: FontWeight.bold,
            color: AppColor.black,
            textSize: Dimens.font_size_title,
          ),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: Dimens.padding_8),
            decoration: BoxDecoration(
              border: const Border.fromBorderSide(
                  BorderSide(color: AppColor.black)),
              borderRadius: BorderRadius.circular(Dimens.circular5),
            ),
            child: TextField(
              maxLength: 6,
              controller: otpEditingController,
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintStyle: TextStyle(color: AppColor.black),
                hintText: 'E.g., 3hu75',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
