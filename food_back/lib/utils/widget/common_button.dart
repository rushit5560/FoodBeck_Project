// ignore_for_file: unrelated_type_equality_checks, prefer_const_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:food_back/constance/app_images.dart';
import 'package:sizer/sizer.dart';

import '../../constance/color.dart';
import '../../constance/font_family.dart';
import '../style.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Color? containerColor;
  final IconData? icon;
  final String? image;
  final VoidCallback onPressed;
  final VoidCallback? onLongPress;
  final double? height;
  bool? miniRadius = false;

  CustomButton(
      {Key? key,
      required this.text,
      this.containerColor,
      this.icon,
      this.image,
      this.miniRadius,
      required this.onPressed,
      this.onLongPress,
      required this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: ElevatedButton(
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
            borderRadius: miniRadius != null && miniRadius != ""
                ? BorderRadius.circular(defaultRadius - 6)
                : BorderRadius.circular(defaultRadius),
          )),
          backgroundColor: MaterialStateProperty.all(containerColor),
          // shadowColor: MaterialStateProperty.all(Colors.transparent),
        ),
        onPressed: onPressed,
        onLongPress: onLongPress,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon != null && icon != ""
                ? Row(
                    children: [
                      Icon(icon, color: Colors.white, size: 24),
                      SizedBox(width: 5)
                    ],
                  )
                : SizedBox(),
            image != null && image != ""
                ? Row(
                    children: [
                      Image.asset(image!, height: 22, color: Colors.white),
                      SizedBox(width: 5)
                    ],
                  )
                : SizedBox(),
            Text(
              text,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: TextStyleConfig.textStyle(
                fontFamily: FontFamilyText.sFProDisplaySemibold,
                textColor: AppColors.whiteColor,
                fontWeight: FontWeight.w500,
                fontSize: 14.sp,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
