

import '../constants/message.dart';

class FieldValidation {
  String? validateName(String value) {
    if (value.isEmpty) {
      return AppMessage.nameIsRequired;
    }
    return null;
  }

  String? validateContactName(String value) {
    if (value.isEmpty) {
      return AppMessage.contactIsRequired;
    }
    return null;
  }

  String? validateLandmark(String value) {
    if (value.isEmpty) {
      return AppMessage.landmarkIsRequired;
    }
    return null;
  }

  String? validateFloor(String value) {
    if (value.isEmpty) {
      return AppMessage.lfloorkIsRequired;
    }
    return null;
  }

  String? validateDropdownAddress(String value) {
    if (value == AppMessage.chooseOption) {
      return AppMessage.pleaseSelectAddress;
    } else {
      return null;
    }
  }

  String? validateDropdownZone(String value) {
    if (value == "Choose zone") {
      return AppMessage.pleaseSelectZone;
    } else {
      return null;
    }
  }

  String? validateHouseNo(String value) {
    if (value.isEmpty) {
      return AppMessage.houseIsRequired;
    }
    return null;
  }

  String? validateAddress(String value) {
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
      // return AppMessage.pleaseEnterValidPassword;
      return "Password is required.";
    } else if (value.length < 8) {
      return AppMessage.pleaseEnterValidPasswordLength;
    }
    return null;
  }

  String? validateOldPassword(String value) {
    // String pattern = AppMessage.patternRegX;
    // RegExp regExp = RegExp(pattern);
    if (value.isEmpty) {
      return "Old password is required.";
    } else if (value.length < 8) {
      return AppMessage.pleaseEnterValidPasswordLength;
    }
    return null;
  }

  String? validateNewPassword(String value, String value2) {
    // String pattern = AppMessage.patternRegX;
    // RegExp regExp = RegExp(pattern);
    if (value.isEmpty) {
      return "New password is required.";
    } else if (value.length < 8) {
      return AppMessage.pleaseEnterValidPasswordLength;
    } else if(value == value2) {
      return "Old & new password must be different.";
    }
    return null;
  }

  String? validateConfirmPassword(String value, String value2) {
    if (value.isEmpty) {
      return "Confirm password is required.";
    } else if (value != value2) {
      return "Password and confirm password both not match.";
    } else {
      return null;
    }
  }
}
