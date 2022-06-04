import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:w3/ui/screens/login/login_screen.dart';
import 'package:w3/ui/screens/root_screen.dart';

import '../../core/services/auth_service.dart';
import '../../locator.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final _authService = locator<AuthService>();
  @override
  void initState() {
    _initialSetup();
    super.initState();
  }

  _initialSetup() async {
    await Future.delayed(const Duration(seconds: 2));
    if (_authService.isLogin) {
      Get.offAll(const RootScreen());
    } else {
      Get.offAll(LoginScreen());
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Splash Screen'),
      ),
    );
  }
}
