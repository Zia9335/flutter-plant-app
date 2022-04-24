import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:w3/core/constants/colors_constants.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  //final _formKey = GlobalKey<FormState>();
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
                    child: Image(
                      height: 220.0.h,
                      fit: BoxFit.cover,
                      image: const AssetImage(
                        'assets/images/green-plants-loginscreen.jpg',
                      ),
                    ),
                    clipper: _LoginScreenClipper(),
                  ),
                  Positioned(
                    top: 20.h,
                    left: 20.h,
                    child: ClipOval(
                      child: Container(
                        height: 25.h,
                        width: 25.h,
                        alignment: Alignment.centerRight,
                        color: Colors.white,
                        child: Icon(
                          Icons.arrow_back_ios,
                          color: kDarkGreen,
                          size: 20.sp,
                        ),
                      ),
                    ),
                  ),

                  Positioned(
                    top: 250.h,
                    bottom: null,
                    right: -6.h,
                    child: RotationTransition(
                      turns: const AlwaysStoppedAnimation(300 / 360),
                      child: Image(
                          width: 90.0.w,
                          height: 90.0.h,
                          image: const AssetImage('assets/images/leaf.png')),
                    ),
                  ),
                  //
                  Positioned.fill(
                    top: 260.h,
                    bottom: null,
                    child: Column(
                      children: [
                        Text(
                          'Welcome back',
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 30.0.sp,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 5.0.h,
                        ),
                        Text(
                          'Login to your account',
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 14.0.sp,
                              color: Colors.grey,
                              fontWeight: FontWeight.w300),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(20.0.w, 120.0.h, 20.0.w, 10.0.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const CustomTextField(
                      iconData: Icons.person,
                      hintText: 'Full Name',
                      obscureText: false,
                      textInputType: TextInputType.name,
                    ),
                    SizedBox(
                      height: 15.0.h,
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
                          child: Text(
                            'Forgot Password?',
                            style: TextStyle(
                                color: kDarkGreen,
                                fontSize: 10.sp,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 80.0.h,
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 10.0.h,
                        ),
                        child: const Text(
                          'Login',
                          style: TextStyle(fontFamily: "Poppins"),
                        ),
                      ),
                      style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0.h),
                          ),
                        ),
                        backgroundColor: MaterialStateProperty.all(kDarkGreen),
                      ),
                    ),
                    SizedBox(
                      height: 10.0.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Don\'t have an account? ',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 15.sp,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                      color: kDarkGreen, width: 1.5.w)),
                            ),
                            child: Text(
                              'Sign Up',
                              style: TextStyle(
                                fontSize: 10.sp,
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
    path.lineTo(0, size.height.h - 55.h);

    path.quadraticBezierTo(
      size.width / 3,
      size.height.h - 10.h,
      size.width,
      size.height.h - 100.h,
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
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: kDarkGreen, width: 1.w),
        ),
        filled: true,
        fillColor: kTextFieldFilledColor,
        contentPadding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
        hintText: hintText,
        hintStyle: TextStyle(
            fontFamily: "Poppins",
            fontSize: 14.sp,
            color: kDarkGreen,
            fontWeight: FontWeight.w500),
        border: inputBorder ??
            OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(10),
            ),
      ),
    );
  }
}
