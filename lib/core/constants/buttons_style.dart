import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:w3/core/constants/colors_constants.dart';

ButtonStyle kLogInScreenElevatedButtonStyle=ButtonStyle(
  shape:
  MaterialStateProperty.all<RoundedRectangleBorder>(
    RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(30.0.r),
    ),
  ),
  backgroundColor: MaterialStateProperty.all(kDarkGreen),
);