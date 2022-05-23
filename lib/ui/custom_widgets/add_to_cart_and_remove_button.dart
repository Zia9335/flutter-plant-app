import 'package:flutter/material.dart';
import 'package:w3/core/constants/colors_constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

//Add To Cart And Remove Button

class AddToCartAndRemoveButton extends StatelessWidget {
  const AddToCartAndRemoveButton(
      {Key? key, required this.onTap, required this.iconData})
      : super(key: key);

  final VoidCallback onTap;
  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          width: 20.w,
          height: 15.h,
          child: Center(
            child: Icon(
              iconData,
              size: 10.h,
            ),
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.r),
            border: Border.all(
              color: kDarkGreen,
            ),
          )),
    );
  }
}
