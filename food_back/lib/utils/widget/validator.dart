
import '../../constance/message.dart';

class FieldValidation {
  String? validateUserEmail(String value) {
    if (value.isEmpty) {
      return AppMessage.emailAddressIsRequired;
    } else if (!isNumeric(value) &&
        !RegExp(AppMessage.emailRegExp).hasMatch(value)) {
      return AppMessage.invalidEmailAddress;
    }
    else if (value.length != 10) {
      return AppMessage.pleaseEnterPhoneNumber;
    }
    else if (!isNumeric(value) &&
        !RegExp(AppMessage.patternRegX).hasMatch(value)) {
      return AppMessage.invalidPassword;
    }
    else {
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

  String? validUserPassword(String value) {
    String pattern = AppMessage.patternRegX;
    RegExp regExp = RegExp(pattern);
    if (value.isEmpty) {
      return AppMessage.pleaseEnterValidPassword;
    } else if (value.length != 10) {
      return AppMessage.mobileNumberMustTenDigits;
    } else if (!regExp.hasMatch(value)) {
      return AppMessage.mobileNumberMustBeDigits;
    } else {
      return null;
    }
  }
}
