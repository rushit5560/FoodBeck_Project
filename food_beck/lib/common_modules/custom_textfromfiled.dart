// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class MyWidget extends StatelessWidget {
  bool obscureText;
  Function()? onPressed;
  Widget? suffixIcon;
  String? hintText;
  MyWidget({
    Key? key,
    required this.obscureText,
    this.onPressed,
    this.suffixIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).dividerColor,
        borderRadius: BorderRadius.circular(13),
      ),
      child: TextFormField(
        obscureText: obscureText,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.only(left: 10, top: 16),
          border: InputBorder.none,
          hintText: hintText,
          hintStyle: Theme.of(context).textTheme.headline1!.copyWith(
              fontSize: 16,
              fontWeight: FontWeight.w100,
              color: const Color.fromARGB(255, 165, 127, 127)),
          suffixIcon: suffixIcon,
          //  GestureDetector(
          //   child: Icon(
          //     loginScreenController.hidePass.value
          //         ? Icons.visibility_off
          //         : Icons.visibility,
          //     color: Theme.of(context).primaryColor,
          //   ),
          //   onTap: () => {
          //     // setState(() => loginScreenController.hidePass.value = !loginScreenController.hidePass.value,),
          //   },
          // ),
        ),
      ),
    );
  }
}
