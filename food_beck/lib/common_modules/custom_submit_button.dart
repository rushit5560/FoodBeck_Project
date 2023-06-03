import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../constants/color.dart';
import '../utils/style.dart';

class CustomSubmitButtonModule extends StatelessWidget {
  Function() onPress;
  String labelText;
  Color buttonColor;
  Color textColor;

  double? labelSize;
  CustomSubmitButtonModule({
    Key? key,
    required this.onPress,
    required this.labelText,
    this.buttonColor = AppColors.greenColor,
    this.textColor = AppColors.whiteColor,
    this.labelSize,
  }) : super(key: key);
  // final locationManageScreenController = Get.find<LocationManageScreenController>();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        // height: 50,
        width: Get.width,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: buttonColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
          onPressed: onPress,
          child: Text(
            labelText,
            style: TextStyleConfig.textStyle(
              textColor: textColor,
              fontSize: labelSize ?? 16.sp,
            ),
          ).paddingSymmetric(vertical: 10),
        ),
      ),
    );
  }
}
class ButtonCustom extends StatelessWidget {
  final String text;
  Color shadowColor;
  Color textColor;
  FontWeight? fontWeight;
  double? textsize;

  Size? size;
  Function() onPressed;
  Color backgroundColor;
  String textFontFamily;
  EdgeInsetsGeometry? padding;

  ButtonCustom({
    Key? key,
    required this.text,
    this.textColor = AppColors.blackColor,
    this.fontWeight = FontWeight.normal,
    this.textsize = 12,
    this.padding,
    this.backgroundColor = AppColors.whiteColor,
    this.size = const Size(double.infinity, 0),
    required this.onPressed,
    this.shadowColor = AppColors.grey100Color,
    this.textFontFamily = "SFProDisplayBold",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: padding,
        shadowColor: shadowColor,
        backgroundColor: backgroundColor,
        elevation: 6,
        minimumSize: size,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyleConfig.textStyle(
          textColor: textColor,
          fontWeight: fontWeight!,
          fontSize: textsize!,
          fontFamily: textFontFamily,
        ),
      ).paddingSymmetric(vertical: 10),
    );
  }
}