import '../constance/message.dart';

class FieldValidation {

  String? validateName(String value) {
    if (value.isEmpty) {
      return AppMessage.nameIsRequired;
    }
    return null;
  }


  String? validateUserEmail(String value) {
    if (value.isEmpty) {
      return AppMessage.emailAddressIsRequired;
    } else if (!isNumeric(value) &&
        !RegExp(AppMessage.emailRegExp).hasMatch(value)) {
      return AppMessage.invalidEmailAddress;
    } else {
      return null;
    }
  }

  bool isNumeric(String s) {
    if (s.isEmpty) {
      return false;
    }
    return double.tryParse(s) != null;
  }

  String? validateUserMobileNumber(String value) {
    String pattern = AppMessage.patternRegX;
    RegExp regExp = RegExp(pattern);

    if (value.isEmpty) {
      return AppMessage.pleaseEnterPhoneNumber;
    } else if (value.length != 10) {
      return AppMessage.mobileNumberMustTenDigits;
    } else if (!regExp.hasMatch(value)) {
      return AppMessage.mobileNumberMustBeDigits;
    } else {
      return null;
    }
  }

  String? validateUserPassword(String value) {
    // String pattern = AppMessage.patternRegX;
    // RegExp regExp = RegExp(pattern);
    if (value.isEmpty) {
      return AppMessage.pleaseEnterValidPassword;
    } else if(value.length < 8) {
      return AppMessage.pleaseEnterValidPasswordLength;
    }
    return null;
  }

  String? validateConfirmPassword(String value, String value2) {
    if (value.isEmpty) {
      return "Confirm password is required";
    } else if (value != value2) {
      return "Password and confirm password both not match";
    } else {
      return null;
    }
  }
}
