import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../constants/color.dart';

class DiscountLabelModule extends StatelessWidget {
  final String label;
  final bool labelShowRightSide;
  final double fontSize;

  const DiscountLabelModule(
      {Key? key, required this.label, required this.labelShowRightSide, this.fontSize = 8})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.greenColor,
        borderRadius: labelShowRightSide == true
            ? const BorderRadius.only(
                topLeft: Radius.circular(10),
                bottomLeft: Radius.circular(10),
              )
            : const BorderRadius.only(
                topRight: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
      ),
      child: Text(
        label,
        style: TextStyle(color: Colors.white, fontSize: fontSize),
      ).paddingSymmetric(horizontal: 5, vertical: 2),
    );
  }
}
