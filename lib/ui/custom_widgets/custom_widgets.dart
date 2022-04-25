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
      required this.prefixIconData,
      this.textInputType,
      this.obscureText,
      required this.hintText,
      this.suffixIconData,
      this.inputBorder})
      : super(key: key);

  // variables
  final String hintText;
  final bool? obscureText;
  final TextInputType? textInputType;
  final InputBorder? inputBorder;
  final IconData prefixIconData;
  final IconData? suffixIconData;
  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: textInputType ?? TextInputType.text,
      obscureText: obscureText ?? false,

      //This is the text field style and decoration
      decoration: InputDecoration(
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
        fillColor: kTextFieldFilledColor,
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
      {Key? key, required this.function, required this.buttonText})
      : super(key: key);
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

// repeated Gesture Detector CircularAvatar home Screen
class GestureCircularAvatar extends StatelessWidget {
  const GestureCircularAvatar(
      {Key? key,
      required this.function,
      this.child,
      this.imageUrl,
      this.backgroundColor})
      : super(key: key);

  final VoidCallback function;
  final Widget? child;
  final imageUrl;
  final Color? backgroundColor;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: function,
      child: CircleAvatar(
        backgroundColor: backgroundColor,
        backgroundImage: imageUrl == null ? null : AssetImage(imageUrl),
        child: child,
        radius: 15.r,
      ),
    );
  }
}

// repeated Recent Viewed Plants Card home Screen
class RecentViewedPlantsCard extends StatelessWidget {
  const RecentViewedPlantsCard({
    Key? key,
    required this.plantImageUrl,
    required this.plantNameText,
    required this.plantDiscribText,
    required this.plantPrice,
    required this.onTapFunction,
  }) : super(key: key);

  // plant image url
  final String plantImageUrl;

  // plant name text
  final String plantNameText;

  // plant type text
  final String plantDiscribText;

  // plant price
  final double plantPrice;

  final VoidCallback? onTapFunction;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapFunction,
      child: Padding(
        padding: EdgeInsets.only(left: 20.w, top: 10.h, bottom: 10.h),
        child: Container(
          height: 70.h,
          width: 200.w,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              // small plant image
              Container(
                width: 60.w,
                height: 60.h,
                child: Center(
                  child: Image.asset(
                    plantImageUrl,
                    fit: BoxFit.contain,
                    height: 50.h,
                    width: 50.w,
                  ),
                ),
                decoration: BoxDecoration(
                  color: Colors.amber.shade100,
                  borderRadius: BorderRadius.circular(15.0),
                ),
              ),

              // plant name
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // plant name
                  Text(
                    plantNameText,
                    style: TextStyle(
                      color: kDarkGreen,
                      fontFamily: "Poppins",
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 5.h),

                  // plant discription
                  Text(
                    plantDiscribText,
                    style: TextStyle(
                      color: Colors.grey,
                      fontFamily: "Poppins",
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              )
            ],
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15.0),
            boxShadow: [
              BoxShadow(
                color: kGreen.withOpacity(0.2),
                spreadRadius: 1.r,
                blurRadius: 3.r,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// repeated Plants Large Card Home Screen
class PlantCard extends StatelessWidget {
  const PlantCard({
    Key? key,
    required this.plantImageUrl,
    required this.plantNameText,
    required this.plantTypeText,
    required this.plantPrice,
    required this.onTapFunction,
  }) : super(key: key);

  // plant image url
  final String plantImageUrl;

  // plant name text
  final String plantNameText;

  // plant type text
  final String plantTypeText;

  // plant price
  final double plantPrice;

  final VoidCallback? onTapFunction;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapFunction,
      child: SizedBox(
        // color: Color.fromARGB(255, 201, 161, 161),
        height: 200.h,
        width: 150.h,
        child: Stack(
          children: [
            Positioned(
              top: 39.h,
              left: 5.w,
              right: 5.w,
              // bottom: 0,
              child: Container(
                decoration: BoxDecoration(
                  color: kTextFieldFilledColor,
                  borderRadius: BorderRadius.circular(10.r),
                ),
                height: 160.h,
              ),
            ),
            Positioned(
              top: 0.h,
              left: 10.w,
              right: 70.w,
              bottom: 50.h,
              child: SizedBox(
                //height: 150.h,
                child: Image.asset(
                  plantImageUrl,
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),
            Positioned(
              top: 39.h,
              left: 5.w,
              right: 5.w,
              child: ClipPath(
                clipper: CardClipper(),
                child: Container(
                  height: 120.h,
                  decoration: BoxDecoration(
                    color: kGreen.withOpacity(0.2),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10.r),
                        topRight: Radius.circular(10.r)),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 10.h,
              left: 15.w,
              right: 15.w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    plantTypeText,
                    style: TextStyle(
                        color: kGreen,
                        fontFamily: "Poppins",
                        fontSize: 10.sp,
                        fontWeight: FontWeight.bold),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        plantNameText,
                        style: TextStyle(
                          fontFamily: "Poppins",
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Container(
                          width: 50.w,
                          height: 15.h,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.r),
                              color: Colors.white),
                          child: Center(
                            child: Text(
                              "\$$plantPrice",
                              style: TextStyle(
                                  color: kGreen,
                                  fontSize: 8.sp,
                                  fontFamily: "Poppins",
                                  fontWeight: FontWeight.bold),
                            ),
                          )),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Custom Clipper for Plant Card Home Screen
class CardClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, size.height.h - 30.h);

    path.quadraticBezierTo(
      size.width / 2,
      size.height.h + 5.h,
      size.width,
      size.height.h - 75.h,
    );
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
