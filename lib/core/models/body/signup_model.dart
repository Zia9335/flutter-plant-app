class SignUpModel {
  String? name;
  String? email;
  String? password;

  SignUpModel({
    this.email,
    this.password,
    this.name,
  });

  fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    //password = json['password'];
  }

  toJson() {
    //  return {
    // 'email': this.email,
    // 'password': this.password,
    // 'name': this.name,

    // 'fcm_token': this.fcmToken,
    // };
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['full_name'] = this.name;
    data['email'] = this.email;
    // data['password'] = this.password;

    return data;
  }
}
