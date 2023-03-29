import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../constance/app_images.dart';
import '../../constance/message.dart';
import '../../controller/splash_screen_controller.dart';


class SplashScreen extends StatelessWidget {
   SplashScreen({Key? key}) : super(key: key);
final splashScreenController = Get.put(SplashScreenController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              Center(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(22),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Hero(
                      tag: 'appIcon',
                      child: Image.asset(
                        AppImages.AppLogo,
                        height: 100,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 1.h),
              Text(
                AppMessage.delites,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyText2!.copyWith(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).backgroundColor,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
