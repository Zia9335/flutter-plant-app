import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:w3/core/constants/text_style.dart';
import 'package:w3/core/constants/colors_constants.dart';
import 'package:w3/core/constants/buttons_style.dart';





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
      text: TextSpan(

          children: [
            TextSpan(text: 'By signing you agree to our ',
              style: kTextFieldHintsTextStyle.copyWith(fontWeight: FontWeight.bold, ),),
            TextSpan(text: 'Team of use ',
                style: kTextFieldHintsTextStyle.copyWith(color: kGrey,)),
            TextSpan(text: '\nand ',
              style: kTextFieldHintsTextStyle.copyWith(fontWeight: FontWeight.bold),),
            TextSpan(text: 'privacy notice ',
                style: kTextFieldHintsTextStyle.copyWith(color: kGrey,)),
          ]
      ),);
  }
}




//Custom Elevated Button
class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    Key? key, required this.function, required this.buttonText
  }) : super(key: key);
  final VoidCallback function;
  final String buttonText;


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
      style: kLogInScreenElevatedButtonStyle,
    );
  }
}
