import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../colors/app_color.dart';
import '../dimens/dimens.dart';
import 'app_text.dart';

class CustomNavBar extends StatelessWidget implements PreferredSizeWidget {
  String? title;
  final double borderRadius; // Added to control corner radius

  CustomNavBar({super.key,
    required this.title,
    this.borderRadius = 16.0, // Default corner radius
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColor.primary,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(borderRadius),
          bottomRight: Radius.circular(borderRadius),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: Dimens.padding_horizontal, vertical: Dimens.padding_vertical),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Center(
                child: AppText(
                  content: title ?? "",
                  fontWeight: FontWeight.bold,
                  color: AppColor.white,
                  textSize: Dimens.font_size_title,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}