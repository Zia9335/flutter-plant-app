import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:w3/core/models/body/login_model.dart';
import 'package:w3/ui/screens/root_screen.dart';

class LoginViewModel with ChangeNotifier {
  LoginModel loginModel = LoginModel();

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

  void callLoginfunction(BuildContext context) async {
    try {
      await _auth
          .signInWithEmailAndPassword(
              email: loginModel.email!, password: loginModel.password!)
          .then((uid) => {
                Fluttertoast.showToast(msg: "Login Successful"),
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => RootScreen()))
              });
    } catch (e) {
      Fluttertoast.showToast(msg: e.toString());
    }
  }
}
