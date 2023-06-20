import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../constants/app_images.dart';
import '../../constants/color.dart';
import '../../constants/font_family.dart';
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
  double? fontSize = 14.sp;

  CustomButton(
      {Key? key,
      required this.text,
      this.containerColor,
      this.icon,
      this.image,
      this.miniRadius,
      required this.onPressed,
      this.onLongPress,
      this.height,
      this.fontSize,
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // height: height,
      child: ElevatedButton(
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
            borderRadius: miniRadius != null && miniRadius != ""
                ? BorderRadius.circular(defaultRadius - 6)
                : BorderRadius.circular(defaultRadius),
          )),
          backgroundColor: MaterialStateProperty.all(AppColors.greenColor),
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
                fontSize: fontSize ?? 14.sp,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
