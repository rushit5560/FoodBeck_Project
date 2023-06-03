import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../constants/color.dart';
import '../constants/message.dart';
import '../utils/style.dart';
import 'custom_submit_button.dart';

class CustomAlertDialog {
  void showAlertDialog({
    required BuildContext context,
    required String textContent,
    required Function() onYesTap,
    required Function() onCancelTap,
  }) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: AppColors.whiteColor,
          title: Text(
            textContent,
            textAlign: TextAlign.center,
          ),
          actionsAlignment: MainAxisAlignment.spaceBetween,
          contentPadding: const EdgeInsets.symmetric(vertical: 40),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
          titleTextStyle: TextStyleConfig.textStyle(fontSize: 18),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                OutlinedButton(
                  onPressed: onYesTap,
                  style: OutlinedButton.styleFrom(
                    backgroundColor: AppColors.greenColor,
                  ),
                  child: Text(
                    AppMessage.yes,
                    style: TextStyleConfig.textStyle(
                      textColor: AppColors.whiteColor,
                      fontSize: 17,
                    ),
                  ),
                ),
                OutlinedButton(
                  onPressed: onCancelTap,
                  style: OutlinedButton.styleFrom(
                    backgroundColor: AppColors.greenColor,
                  ),
                  child: Text(
                    AppMessage.no,
                    style: TextStyleConfig.textStyle(
                      textColor: AppColors.whiteColor,
                      fontSize: 17,
                    ),
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}

class CustomLogoutAlertDialog extends StatelessWidget {
  String text;
  String content;
  String yesButtonText;
  String noButtonText;
  Function() onYesPressed;
  Function() onNoPressed;
  // Color? activeColor;
  EdgeInsetsGeometry? titlePadding;
  EdgeInsetsGeometry? contentPadding;
  CustomLogoutAlertDialog({
    Key? key,
    required this.text,
    required this.content,
    required this.onYesPressed,
    required this.onNoPressed,
    required this.yesButtonText,
    required this.noButtonText,
    // required this.activeColor,
    this.titlePadding,
    this.contentPadding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      titlePadding: titlePadding,
      title: Text(
        text,
        style: TextStyleConfig.textStyle(
          // fontFamily: FontFamilyText.sFProDisplayRegular,
          textColor: AppColors.blackColor,
          fontSize: 14.sp,
          fontWeight: FontWeight.bold,
        ),
      ),
      contentPadding: contentPadding,
      content: Text(
        content,
        style: TextStyleConfig.textStyle(
          // fontFamily: FontFamilyText.sFProDisplayRegular,
          textColor: AppColors.blackColor,
          fontSize: 14.sp,
          fontWeight: FontWeight.bold,
        ),
      ),
      actions: [
        const Divider(thickness: 1),
        Row(
          children: [
            Expanded(
              child: ButtonCustom(
                text: yesButtonText,
                onPressed: onYesPressed,
                fontWeight: FontWeight.bold,
                textsize: 14.sp,
                // textFontFamily: FontFamilyText.sFProDisplayHeavy,
                textColor: AppColors.whiteColor2,
                backgroundColor: AppColors.greenColor,
              ),
            ),
            const SizedBox(width: 15),
            Expanded(
              child: ButtonCustom(
                text: noButtonText,
                onPressed: onNoPressed,
                fontWeight: FontWeight.bold,
                textsize: 14.sp,
                // textFontFamily: FontFamilyText.sFProDisplayHeavy,
                textColor: AppColors.whiteColor2,
                backgroundColor: AppColors.greenColor,
              ),
            ),
          ],
        ),
      ],
    );
  }
}


// class CustomMobileBackPressAlertDialog extends StatelessWidget {
//   // String textContent;
//   // Function() onYesTap;
//   // Function() onCancelTap;

//   CustomMobileBackPressAlertDialog({
//     Key? key,
//     // required String textContent,
//     // required Function() onYesTap,
//     // required Function() onCancelTap,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return AlertDialog(
//       backgroundColor: AppColors.whiteColor,
//       title: Text(
//         AppMessage.backAlertMessage,
//         textAlign: TextAlign.center,
//       ),
//       actionsAlignment: MainAxisAlignment.spaceBetween,
//       contentPadding: const EdgeInsets.symmetric(vertical: 40),
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
//       titleTextStyle: TextStyleConfig.textStyle(fontSize: 18),
//       actions: [
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           children: [
//             OutlinedButton(
//               onPressed: () {
//                 exit(0);
//               },
//               style: OutlinedButton.styleFrom(
//                   backgroundColor: AppColors.appColors),
//               child: Text(
//                 AppMessage.yes,
//                 style: TextStyleConfig.textStyle(
//                   textColor: AppColors.whiteColor,
//                   fontSize: 17,
//                 ),
//               ),
//             ),
//             OutlinedButton(
//               onPressed: () {
//                 Get.back();
//               },
//               style: OutlinedButton.styleFrom(
//                   backgroundColor: AppColors.appColors),
//               child: Text(
//                 AppMessage.no,
//                 style: TextStyleConfig.textStyle(
//                   textColor: AppColors.whiteColor,
//                   fontSize: 17,
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ],
//     );
//   }
// }
