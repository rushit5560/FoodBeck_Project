import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_back/utils/extensions.dart';
import 'package:food_back/utils/style.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../constance/app_images.dart';
import '../../../constance/color.dart';
import '../../../constance/font_family.dart';
import '../../../constance/message.dart';
import '../../../controller/add_address_screen_controller.dart';
import '../../../model/sign_up_model/zone_model.dart';
import '../../../utils/validator.dart';
import '../../../utils/widget/common_text_form_field.dart';

class AddAddressTextFormFieldModule extends StatelessWidget {
  AddAddressTextFormFieldModule({super.key});
  final addAddressScreenController = Get.find<AddAddressScreenController>();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: Get.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            // border: Border.all(color: AppColors.greyColor),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 3),
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.grey50Color,
                borderRadius: BorderRadius.circular(10),
                // border: Border.all(color: Colors.transparent),
              ),
              // child: DropdownButtonHideUnderline(
              child: SizedBox(
                // height: 50,
                child: Center(
                  child: DropdownButtonFormField<String>(
                    validator: (value) =>
                        FieldValidation().validateDropdownAddress(value!),
                    decoration: const InputDecoration.collapsed(hintText: ''),
                    value: addAddressScreenController.selectAddressValue.value,
                    items: addAddressScreenController.isAddressList
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          // style: TextStyleConfig.textStyle(
                          //   textColor: AppColors.greyColor,
                          //   fontFamily: FontFamilyText.sFProDisplayRegular,
                          // ),
                        ),
                      );
                    }).toList(),
                    borderRadius: BorderRadius.circular(10),
                    icon: const Icon(Icons.arrow_drop_down_sharp)
                        .commonSymmetricPadding(horizontal: 10),
                    onChanged: (String? value) {
                      addAddressScreenController.isLoading(true);
                      addAddressScreenController.addressHomeTypeController
                          .clear();
                      addAddressScreenController.addressOfficeTypeController
                          .clear();
                      addAddressScreenController.addressOtherController.clear();
                      addAddressScreenController.selectAddressValue.value =
                          value!;
                      addAddressScreenController.isLoading(false);
                    },
                  ).commonOnlyPadding(left: 10, right: 10, top: 10, bottom: 10),
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: 2.h),
        CommonTextFormFieldModule(
          fieldController:
              addAddressScreenController.contactPersonNameController,
          validate: (value) => FieldValidation().validateContactName(value!),
          hintText: AppMessage.contactName,
          keyboardType: TextInputType.text,
          color: AppColors.grey50Color,
        ),
        SizedBox(height: 2.h),

        Row(
          children: [
            Expanded(
              child: CommonTextFormFieldModule(
                fieldController: addAddressScreenController.houseNoController,
                validate: (value) => FieldValidation().validateHouseNo(value!),
                hintText: AppMessage.houseNo,
                keyboardType: TextInputType.number,
                color: AppColors.grey50Color,
              ),
            ),
            SizedBox(width: 2.w),
            Expanded(
              child: CommonTextFormFieldModule(
                fieldController: addAddressScreenController.floorController,
                validate: (value) => FieldValidation().validateFloor(value!),
                hintText: AppMessage.floor,
                keyboardType: TextInputType.text,
                color: AppColors.grey50Color,
              ),
            ),
          ],
        ),
        SizedBox(height: 2.h),

        CommonTextFormFieldModule(
          fieldController: addAddressScreenController.contactPhoneNoController,
          validate: (value) =>
              FieldValidation().validateUserMobileNumber(value!),
          hintText: AppMessage.contactNumber,
          keyboardType: TextInputType.number,
          color: AppColors.grey50Color,
          maxLength: 10,
        ),
        SizedBox(height: 2.h),
        CommonTextFormFieldModule(
          fieldController: addAddressScreenController.addressController,
          validate: (value) => FieldValidation().validateAddress(value!),
          hintText: AppMessage.address,
          keyboardType: TextInputType.text,
          color: AppColors.grey50Color,
        ),
        SizedBox(height: 2.h),

        CommonTextFormFieldModule(
          fieldController: addAddressScreenController.landmarkController,
          validate: (value) => FieldValidation().validateLandmark(value!),
          hintText: AppMessage.landmark,
          keyboardType: TextInputType.text,
          color: AppColors.grey50Color,
        ),
        SizedBox(height: 2.h),

        /// Dropdown Module
        Container(
          width: Get.width,
          height: 40,
          decoration: const BoxDecoration(
            color: AppColors.grey50Color,
            borderRadius: BorderRadius.all(Radius.circular(15)),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<ZoneData>(
              isExpanded: true,
              borderRadius: BorderRadius.circular(15),
              value: addAddressScreenController.selectedZoneValue,
              onChanged: (value) =>
                  addAddressScreenController.selectValueFromDropdown(value!),
              items: addAddressScreenController.zoneList.map((ZoneData items) {
                return DropdownMenuItem(
                  value: items,
                  child: Text(items.name!),
                );
              }).toList(),
            ),
          ).commonSymmetricPadding(horizontal: 15),
        ),
      ],
    );
  }
}
