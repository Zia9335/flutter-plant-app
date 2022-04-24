import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:w3/core/constants/colors_constants.dart';
//This the Clipper of logIn screen top big image
class LoginScreenClipper extends CustomClipper<Path> {
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
              borderRadius: BorderRadius.circular(10.r),
            ),
      ),
    );
  }
}
