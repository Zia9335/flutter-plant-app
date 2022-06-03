class LoginModel {
  String? email;
  String? password;

  LoginModel({this.email, this.password});

  toJson() => {
        'email': email,
        'password': password,
      };
}
