import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../colors/app_color.dart';
import '../dimens/dimens.dart';
import 'app_text.dart';

/// WARNING DIALOG
showWarningDialog({required BuildContext context, required String content}) {
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          actions: <Widget>[
            Center(
                child: ElevatedButton(
                    onPressed: () => Get.back(),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: AppColor.primary),
                    child: AppText(
                      content: 'Okay',
                      color: AppColor.white,
                    )))
          ],
          content: AppText(content: content),
          title: Center(
              child: AppText(
                content: 'WARNING',
                color: AppColor.amber,
                fontWeight: FontWeight.bold,
                textSize: Dimens.font_size_title,
              )),
        );
      });
}

///ERROR DIALOG
showErrorDialog({required BuildContext context, required String content}) {
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          actions: <Widget>[
            Center(
                child: ElevatedButton(
                    onPressed: () => Get.back(),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: AppColor.primary),
                    child: AppText(
                      content: 'Okay',
                      color: AppColor.white,
                    )))
          ],
          content: AppText(content: content),
          title: Center(
              child: AppText(
                content: 'ERROR',
                color: AppColor.red,
                fontWeight: FontWeight.bold,
                textSize: Dimens.font_size_title,
              )),
        );
      });
}

///SHOW ALERT DIALOG
showAlertDialog({required BuildContext context, String? title, required Function()? onSubmitFunction, required Widget widget}){
  return AlertDialog(
    title: Center(
        child: AppText(
          content: title ?? "",
          fontWeight: FontWeight.bold,
          textSize: Dimens.font_size_title,
        )),
    content: IntrinsicHeight(
        child: widget
    ),
    actions: <Widget>[
      ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: AppColor.cancelColor),
          onPressed: () => Get.back(),
          child: AppText(content: 'Cancel', color: AppColor.white, fontWeight: FontWeight.bold,)),
      ElevatedButton(
        onPressed: onSubmitFunction,
        child: AppText(
          content: 'Okay',
          color: AppColor.white,
          fontWeight: FontWeight.bold,
        ),
        style: ElevatedButton.styleFrom(
            backgroundColor: AppColor.submitColor),
      )
    ],
  );
}