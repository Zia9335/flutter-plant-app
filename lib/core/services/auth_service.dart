import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:w3/core/models/auth_result.dart';
import 'package:w3/core/models/body/login_model.dart';

class AuthService {
  final _auth = FirebaseAuth.instance;
  User? user;
  bool isLogin = false;

  AuthService() {
    doSetup();
  }

  doSetup() {
    user = _auth.currentUser;
    isLogin = user != null;
  }

  Future<AuthResult> loginWithEmailAndPassword(LoginBody body) async {
    try {
      UserCredential credential = await _auth.signInWithEmailAndPassword(
          email: body.email!, password: body.password!);
      if (credential.user != null) {
        isLogin = true;
        user = credential.user;
        return AuthResult(status: true);
      } else {
        return AuthResult(status: false, error: 'Login failed');
      }
    } on FirebaseAuthException catch (e) {
      return AuthResult(status: false, error: e.message);
    }
  }
}
