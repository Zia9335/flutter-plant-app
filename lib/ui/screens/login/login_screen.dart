import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:w3/core/constants/colors_constants.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  bool? value = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                clipBehavior: Clip.none,
                children: [
                  ClipPath(
                    child: const Image(
                      height: 300,
                      fit: BoxFit.cover,
                      image: AssetImage(
                        'assets/images/green-plants-loginscreen.jpg',
                      ),
                    ),
                    clipper: _LoginScreenClipper(),
                  ),
                  Positioned(
                    top: 20.h,
                    left: 20.h,
                    // bottom: 30,
                    child: ClipOval(
                      child: Container(
                        height: 25.h,
                        width: 25.h,
                        alignment: Alignment.centerRight,
                        color: Colors.white,
                        child: const Icon(
                          Icons.arrow_back_ios,
                          color: kDarkGreen,
                          size: 20,
                        ),
                      ),
                    ),
                  ),

                  Positioned(
                    top: 282.h,
                    bottom: null,
                    right: -6.h,
                    child: const RotationTransition(
                      turns: AlwaysStoppedAnimation(300 / 360),
                      child: Image(
                          width: 90.0,
                          height: 90.0,
                          image: AssetImage('assets/images/leaf.png')),
                    ),
                  ),
                  //
                  Positioned.fill(
                    top: 280.h,
                    bottom: null,
                    left: 0.h,
                    right: 0.h,
                    child: Column(
                      children: [
                        const Text(
                          'Welcome back',
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 30,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 5.0,
                        ),
                        const Text(
                          'Login to your account',
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 14,
                              color: Colors.grey,
                              fontWeight: FontWeight.w300),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 100, 20, 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const CustomTextField(
                      iconData: Icons.person,
                      hintText: 'Full Name',
                      obscureText: false,
                      textInputType: TextInputType.name,
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    const CustomTextField(
                      iconData: Icons.lock,
                      hintText: '******',
                      obscureText: true,
                      textInputType: TextInputType.visiblePassword,
                    ),
                    Row(
                      children: [
                        Transform.scale(
                          scale: 0.8,
                          child: Checkbox(
                            splashRadius: 5,
                            tristate: false,
                            materialTapTargetSize:
                                MaterialTapTargetSize.shrinkWrap,
                            value: value,
                            onChanged: (newValue) {
                              setState(() {
                                value = newValue;
                              });
                            },
                            activeColor: kDarkGreen,
                            checkColor: Colors.white,
                            shape: const CircleBorder(),
                          ),
                        ),
                        const Text(
                          'Remember me',
                          style: TextStyle(color: Colors.grey, fontSize: 10),
                        ),
                        const Spacer(),
                        GestureDetector(
                          onTap: () {},
                          child: const Text(
                            'Forgot Password?',
                            style: TextStyle(
                                color: kDarkGreen,
                                fontSize: 10,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 100,
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: const Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 10.0,
                        ),
                        child: Text(
                          'Login',
                        ),
                      ),
                      style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        backgroundColor: MaterialStateProperty.all(kDarkGreen),
                      ),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Don\'t have an account? ',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 15,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            decoration: const BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                      color: kDarkGreen, width: 1.5)),
                            ),
                            child: const Text(
                              'Sign Up',
                              style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _LoginScreenClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, size.height - 50);

    path.quadraticBezierTo(
      size.width / 3,
      size.height,
      size.width,
      size.height - 90,
    );
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {Key? key,
      required this.iconData,
      this.textInputType,
      this.obscureText,
      required this.hintText,
      this.inputBorder})
      : super(key: key);
  final String hintText;
  final bool? obscureText;
  final TextInputType? textInputType;
  final InputBorder? inputBorder;
  final IconData iconData;
  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: textInputType ?? TextInputType.text,
      obscureText: obscureText ?? false,
      decoration: InputDecoration(
        prefixIcon: Icon(iconData, color: kDarkGreen),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: kDarkGreen, width: 1.0),
        ),
        filled: true,
        fillColor: kTextFieldFilledColor,
        contentPadding:
            const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
        hintText: hintText,
        hintStyle: const TextStyle(
            fontFamily: "Poppins",
            fontSize: 14.0,
            color: kDarkGreen,
            fontWeight: FontWeight.w500),
        border: inputBorder ??
            OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(10.0),
            ),
      ),
    );
  }
}
