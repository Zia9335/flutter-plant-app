// ignore: file_names

import 'package:flutter/material.dart';

class SignUpViewModel with ChangeNotifier {
  //
  String? nameValidation(String? value) {
    return value != null && value.length < 4
        ? "Name should be at least 4 characters"
        : null;
  }

  String? emailValidation(String? value) {
    return value != null && value.length < 8 && !value.contains('@')
        ? "Email should at least 8 char with @"
        : null;
  }

  String? passwordValidation(String? value) {
    return value != null && value.length < 8
        ? "Password should at least 8 characters"
        : null;
  }

  String? confirmedPasswordlValidation(String? value) {
    return value != null && value.length < 8
        ? "Password should at least 8 characters"
        : null;
  }
}
