import 'package:flutter/material.dart';
import 'package:food_back/utils/extensions.dart';
import 'package:get/get.dart';
import '../../constance/color.dart';
import '../../constance/message.dart';
import '../../controller/edit_profile_screen_controller.dart';
import '../../utils/widget/common_text_form_field.dart';

class EditProfileScreen extends StatelessWidget {
  EditProfileScreen({super.key});
  final editProfileScreenController = Get.put(EditProfileScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          AppMessage.editProfile,
          style: const TextStyle(color: AppColors.blackColor),
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(25),
            bottomLeft: Radius.circular(25),
          ),
        ),
      ),
      body: Obx(
        ()=>  Column(
          children: [
            CommonTextFormFieldModule(
              fieldController: ,
            ),
          ],
        ).commonSymmetricPadding(horizontal: 20),
      ),
    );
  }
}
