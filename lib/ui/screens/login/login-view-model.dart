import 'package:flutter/material.dart';
import 'package:w3/core/models/textField_vatidationitem.dart';

class LoginValidation with ChangeNotifier {
  ValidationItem _email = ValidationItem(null, null);
  ValidationItem _password = ValidationItem(null, null);

  //Getters
  ValidationItem get email => _email;
  ValidationItem get password => _password;

  //Setter
  void changeEmail(String value) {
    if (value.length >= 3) {
      _email = ValidationItem(value, null);
    } else {
      _email = ValidationItem(null, "Must be at email please check");
    }
    notifyListeners();
  }

  bool get isValid {
    if (_email.value != null && _password.value != null) {
      return true;
    } else {
      return false;
    }
  }

  void changePassword(String value) {
    if (value.length >= 7) {
      _password = ValidationItem(value, null);
    } else {
      _password = ValidationItem(null, "Must be at least 9 characters");
    }
    notifyListeners();
  }

  void submitData() {
    print("email: ${email.value}, password: ${password.value}");
  }
}
