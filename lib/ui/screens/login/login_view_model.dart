import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:w3/core/models/body/login_model.dart';
import 'package:w3/core/services/auth_service.dart';
import 'package:w3/locator.dart';
import 'package:w3/ui/screens/cart/cart-view-model.dart';
import 'package:w3/ui/screens/root_screen.dart';

class LoginViewModel with ChangeNotifier {
  LoginBody loginModel = LoginBody();
  final _authService = locator<AuthService>();

  final _auth = FirebaseAuth.instance;

  void setEmail(String email) {
    loginModel.email = email;
    notifyListeners();
  }

  void setPassword(String password) {
    loginModel.password = password;
    notifyListeners();
  }

  //
  String? emailValidation(String? value) {
    if (value != null && value.length < 8) {
      return "Email should at leasts 8 ";
    } else if (value!.contains('@')) {
      return null;
    } else {
      return "Email should contain @";
    }
  }

  String? passwordValidation(String? value) {
    return value != null && value.length < 8
        ? "Password should be at least 8 characters"
        : null;
  }

  void login() async {
    final authResult = await _authService.loginWithEmailAndPassword(loginModel);
    if (authResult.status) {
      Get.offAll(const RootScreen());
    } else {
      Get.snackbar('Login Failed', authResult.error!);
    }
  }
}
