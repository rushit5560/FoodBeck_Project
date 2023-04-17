// ignore_for_file: prefer_const_constructors, unnecessary_new, constant_identifier_names, equal_keys_in_map
import 'package:delites/Home/home_screen.dart';
import 'package:delites/Login/login_screen.dart';
import 'package:delites/constance/constance.dart';
import 'package:delites/constance/theme.dart';
import 'package:delites/splash/spash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:delites/constance/constance.dart' as constance;

import 'Introduction/choosetopic_screen.dart';
import 'Introduction/introduction_screen1.dart';
import 'Password/forgot_password.dart';
import 'Password/reset_password.dart';
import 'Password/verification_screen.dart';
import 'SignUp/signup_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((_) => runApp(new MyApp()));
}

class MyApp extends StatefulWidget {
  static setCustomeTheme(BuildContext context, int index) {
    final _MyAppState? state = context.findAncestorStateOfType<_MyAppState>();
    state!.setCustomeTheme(index);
  }

  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  setCustomeTheme(int index) {
    if (index == 6) {
      setState(() {
        AppTheme.isLightTheme = true;
      });
    } else if (index == 7) {
      setState(() {
        AppTheme.isLightTheme = false;
      });
    } else {
      setState(() {
        constance.colorsIndex = index;
        constance.primaryColorString =
            ConstanceData().colors[constance.colorsIndex];
        constance.secondaryColorString = constance.primaryColorString;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Delites',
      theme: AppTheme.getTheme(),
      debugShowCheckedModeBanner: false,
      routes: routes,
    );
  }

  var routes = <String, WidgetBuilder>{
    Routes.SPLASH: (BuildContext context) => SplashScreen(),
    Routes.FORGOT: (BuildContext context) => ForgotPassword(),
    Routes.RESETPASS: (BuildContext context) => ResetPassword(),
    Routes.LOGIN: (BuildContext context) => LoginScreen(),
    Routes.SINGIN: (BuildContext context) => SignupScreen(),
    Routes.VERIFICATION: (BuildContext context) => VerificationScreen(),
    Routes.HOME: (BuildContext context) => HomeScreen(),
    Routes.INTRODUCTIONSCREEN1: (BuildContext context) => IntroductionScreen1(),
    Routes.CHOOSETOPIC: (BuildContext context) => ChoosetopicScreen(),
    Routes.LOGOUT: (BuildContext context) => LoginScreen(),
  };
}

class Routes {
  static const SPLASH = "/";
  static const FORGOT = "/Password/forgot_password.dart";
  static const RESETPASS = "/Password/reset_password.dart";
  static const HOME = "/Home/home_screen.dart";
  static const LOGIN = "/Login/login_screen";
  static const SINGIN = "/SignUp/signup_screen.dart";
  static const VERIFICATION = "/Password/verification_screen.dart";
  static const INTRODUCTIONSCREEN1 = "/Introduction/introduction_screen1.dart";
  static const CHOOSETOPIC = "/Introduction/choosetopic_screen.dart";
  static const LOGOUT = "/login/login_screen.dart";
}
