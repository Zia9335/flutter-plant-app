// ignore: file_names
import 'package:flutter/material.dart';
import 'package:w3/core/models/textField_vatidationitem.dart';

class SignUpValidation with ChangeNotifier {
  ValidationItem _name = ValidationItem(null, null);
  ValidationItem _email = ValidationItem(null, null);
  ValidationItem _password = ValidationItem(null, null);
  ValidationItem _confirmPassword = ValidationItem(null, null);

  //Getters
  ValidationItem get name => _name;
  ValidationItem get email => _email;
  ValidationItem get password => _password;
  ValidationItem get confirmPassword => _confirmPassword;

  //Setter
  //
  void changeName(String value) {
    if (value.length >= 4) {
      _name = ValidationItem(value, null);
    } else {
      _name = ValidationItem(null, "Must be enter your name");
    }
    notifyListeners();
  }

  //
  void changeEmail(String value) {
    if (value.length >= 3) {
      _email = ValidationItem(value, null);
    } else {
      _email = ValidationItem(null, "Must be at email please check");
    }
    notifyListeners();
  }

//
  void changePassword(String value) {
    if (value.length >= 7) {
      _password = ValidationItem(value, null);
    } else {
      _password = ValidationItem(null, "Must be at least 9 characters");
    }
    notifyListeners();
  }

  //

  void changeConfirmPassword(String value) {
    if (value.length >= 7) {
      _confirmPassword = ValidationItem(value, null);
    } else {
      _confirmPassword = ValidationItem(null, "Must be enter your name");
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

  void submitData() {
    print("email: ${email.value}, password: ${password.value}");
  }
}
