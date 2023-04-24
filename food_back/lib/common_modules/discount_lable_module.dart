import 'package:flutter/material.dart';
import 'package:food_back/utils/extensions.dart';

import '../constance/color.dart';

class DiscountLabelModule extends StatelessWidget {
  final String label;
  final bool labelShowRightSide;

  const DiscountLabelModule(
      {Key? key, required this.label, required this.labelShowRightSide})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.greenColor,
        borderRadius: labelShowRightSide == true
            ? const BorderRadius.only(
                topRight: Radius.circular(10),
                bottomRight: Radius.circular(10),
              )
            : const BorderRadius.only(
                topRight: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
      ),
      child: Text(
        label,
        style: const TextStyle(color: Colors.white, fontSize: 8),
      ).commonSymmetricPadding(horizontal: 5, vertical: 2),
    );
  }
}
