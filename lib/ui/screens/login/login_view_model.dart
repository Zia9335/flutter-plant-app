import 'package:flutter/material.dart';

class LoginViewModel with ChangeNotifier {
  //
  String? nameValidation(String? value) {
    return value != null && value.length < 4
        ? "Name should be at least 4 characters"
        : null;
  }

  String? passwordValidation(String? value) {
    return value != null && value.length < 8
        ? "Password should be at least 8 characters"
        : null;
  }
}
