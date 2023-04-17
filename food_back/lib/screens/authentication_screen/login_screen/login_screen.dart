import 'package:flutter/material.dart';
import 'package:food_back/constance/extension.dart';
import 'package:food_back/controller/auth_controller/login_screen_controller.dart';
import 'package:food_back/screens/authentication_screen/login_screen/login_screen_widgets.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final loginScreenController = Get.put(LoginScreenController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SignInAllModule().commonSymmetricPadding(horizontal: 25),
    );
  }
}
