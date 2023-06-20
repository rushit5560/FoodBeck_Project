import 'package:flutter/material.dart';
import 'package:food_beck/screens/index_screen/index_screen.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'constants/color.dart';
import 'screens/splash_screen/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(
        builder: (context, orientation, deviceType) {
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            debugShowMaterialGrid: false,
            title: 'Food Beck',
            home: IndexScreen(),

            theme: ThemeData(
              useMaterial3: true,
              tabBarTheme: const TabBarTheme(
                dividerColor: Colors.transparent,
                indicatorColor: AppColors.greenColor,
                labelColor: AppColors.greenColor,
                unselectedLabelColor: AppColors.greyColor,
              ),
              bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                selectedIconTheme: IconThemeData(
                  color: AppColors.greenColor,
                ),
                selectedLabelStyle: TextStyle(color: AppColors.greenColor),
              ),
            ),
          );
        },
    );
  }
}

