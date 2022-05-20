import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:w3/core/constants/text_style.dart';
import 'package:w3/core/constants/colors_constants.dart';
import 'package:w3/core/constants/buttons_style.dart';
import 'package:w3/ui/screens/product_details/product_details.dart';

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

//Custom Text Field
class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {Key? key,
      required this.prefixIconData,
      this.textInputType,
      this.obscureText,
      required this.hintText,
      this.suffixIconData,
      this.inputBorder,
      this.errorText,
      required this.function})
      : super(key: key);

  // variables
  final String hintText;
  final bool? obscureText;
  final TextInputType? textInputType;
  final InputBorder? inputBorder;
  final IconData prefixIconData;
  final IconData? suffixIconData;

  final errorText;
  final Function(String)? function;
  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: function,

      keyboardType: textInputType ?? TextInputType.text,
      obscureText: obscureText ?? false,

      //This is the text field style and decoration
      decoration: InputDecoration(
        errorText: errorText,
        suffixIcon: Icon(
          suffixIconData,
          color: kDarkGreen,
          size: 18.h,
        ),
        prefixIcon: Icon(
          prefixIconData,
          color: kDarkGreen,
          size: 18.h,
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: kDarkGreen, width: 1.w),
        ),
        filled: true,
        fillColor: kLightenDarkGreenColor,
        contentPadding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 20.w),
        hintText: hintText,
        hintStyle: kTextFieldHintsTextStyle,
        border: inputBorder ??
            OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(10.r),
            ),
      ),
    );
  }
}

/* SignUp Screen Text "By signing you agree to our Team
of use and privacy notice"
 */
class RichTextAgreeWithTeamText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(children: [
        TextSpan(
          text: 'By signing you agree to our ',
          style: kTextFieldHintsTextStyle.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        TextSpan(
            text: 'Team of use ',
            style: kTextFieldHintsTextStyle.copyWith(
              color: kGrey,
            )),
        TextSpan(
          text: '\nand ',
          style: kTextFieldHintsTextStyle.copyWith(fontWeight: FontWeight.bold),
        ),
        TextSpan(
            text: 'privacy notice ',
            style: kTextFieldHintsTextStyle.copyWith(
              color: kGrey,
            )),
      ]),
    );
  }
}

//Custom Elevated Button
class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton(
      {Key? key,
      required this.function,
      required this.buttonText,
      this.borderRadiusGeometry})
      : super(key: key);
  final VoidCallback function;
  final String buttonText;
  final BorderRadiusGeometry? borderRadiusGeometry;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: function,
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: 10.0.h,
        ),
        child: Text(
          buttonText,
          style: kLongInButtonTextStyle,
        ),
      ),
      style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: borderRadiusGeometry ?? BorderRadius.circular(30.0.r),
          ),
        ),
        backgroundColor: MaterialStateProperty.all(kDarkGreen),
      ),
    );
  }
}

// repeated Small Leaves Picture login screen and sign up screen
class SmallLeavesPicture extends StatelessWidget {
  const SmallLeavesPicture({
    Key? key,
    required this.positionFromTop,
  }) : super(key: key);

  final double positionFromTop;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: positionFromTop,
      bottom: null,
      right: -6.h,
      child: RotationTransition(
        turns: const AlwaysStoppedAnimation(300 / 360),
        child: Image(
            width: 90.0.w,
            height: 90.0.h,
            image: const AssetImage('assets/images/leaf.png')),
      ),
    );
  }
}

// repeated CircularBackButton login screen and sign up screen
class CircularBackButton extends StatelessWidget {
  const CircularBackButton({Key? key, required this.onTapFuction})
      : super(key: key);

  final VoidCallback onTapFuction;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 20.h,
      left: 20.h,
      child: GestureDetector(
        onTap: onTapFuction,
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
    );
  }
}
