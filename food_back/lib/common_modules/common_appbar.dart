import 'package:flutter/material.dart';

import '../constance/color.dart';
PreferredSizeWidget customAppBar({
  required String titleText,
  required bool leadingShow,
  Widget? leadingIcon,
  Function()? leadingOnTap,
  required bool actionShow,
  Widget? actionIcon,
  Function()? actionOnTap,
  TextStyle? style,
  Color? color,
}) {
  return AppBar(
    centerTitle: true,
    toolbarHeight: 50,
    backgroundColor: AppColors.whiteColor2,
    leading: leadingShow
        ? IconButton(
            onPressed: leadingOnTap ?? () {},
            icon: leadingIcon!,
            color: color,
          )
        : null,
    title: Text(
      titleText,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: style,
    ),
    actions: [
      actionShow
          ? IconButton(
              onPressed: actionOnTap ?? () {},
              icon: actionIcon!,
            )
          : Container(),
    ],
  );
}
