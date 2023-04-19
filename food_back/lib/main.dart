import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food_back/screens/authentication_screen/sign_in_screen/sign_in_screen.dart';
import 'package:food_back/utils/theme.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:food_back/constance/app_images.dart' as constance;
import 'constance/app_images.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((_) => runApp(const MyApp()));
}

class MyApp extends StatefulWidget {
  static setCustomTheme(BuildContext context, int index) {
    final _MyAppState? state = context.findAncestorStateOfType<_MyAppState>();
    state!.setCustomTheme(index);
  }

  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  setCustomTheme(int index) {
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
            AppImages().colors[constance.colorsIndex];
        constance.secondaryColorString = constance.primaryColorString;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: AppTheme.getTheme(),
          home: SignInScreen(),
          debugShowMaterialGrid: false,
        );
      },
    );
  }
}
