// ignore: file_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:w3/core/models/body/signup_model.dart';
import 'package:w3/ui/screens/login/login_screen.dart';

class SignUpViewModel with ChangeNotifier {
  String? confirmPassword;

  final _auth = FirebaseAuth.instance;
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  SignUpModel signUpModel = SignUpModel();

  void setName(String name) {
    signUpModel.name = name;
    notifyListeners();
  }

  void setEmail(String email) {
    signUpModel.email = email;
    notifyListeners();
  }

  void setPassword(String password) {
    signUpModel.password = password;
    notifyListeners();
  }

  void setConfirmPassword(String confirmPassword) {
    this.confirmPassword = confirmPassword;
    notifyListeners();
  }

  bool checkConfirmPassword() {
    return signUpModel.password == confirmPassword ? true : false;
  }

  String? nameValidation(String? value) {
    return value != null && value.length < 4
        ? "Name should be at least 4 characters"
        : null;
  }

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
        ? "Password should at least 8 characters"
        : null;
  }

  String? confirmedPasswordlValidation(String? value) {
    if (value != null && value.length < 8) {
      return "Password should at least 8 characters";
    } else if (value == signUpModel.password) {
      return null;
    } else {
      return "Password does not match";
    }
  }

  void callSignupfunction(BuildContext context) async {
    try {
      await _auth
          .createUserWithEmailAndPassword(
              email: signUpModel.email!, password: signUpModel.password!)
          .then((uid) => {
                sendDetailsToFirestore(context),
              });
    } catch (e) {
      Fluttertoast.showToast(msg: e.toString());
    }
  }

  sendDetailsToFirestore(BuildContext context) async {
    User? user = _auth.currentUser;

    await firebaseFirestore
        .collection("users")
        .doc(user!.uid)
        .set(signUpModel.toJson());
    Fluttertoast.showToast(msg: "Register Successful");
    Navigator.pushAndRemoveUntil(
        (context),
        MaterialPageRoute(builder: (context) => LoginScreen()),
        (route) => false);
  }
}
