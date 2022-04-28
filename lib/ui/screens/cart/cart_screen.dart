import 'package:w3/ui/custom_widgets/home_screen_costum_widgets.dart';
import 'package:w3/ui/screens/product_details/product_details.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:w3/core/constants/colors_constants.dart';
import 'package:w3/ui/custom_widgets/custom_widgets.dart';
import 'package:w3/core/constants/text_style.dart';
import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';

import 'package:w3/core/constants/buttons_style.dart';
import 'package:w3/ui/screens/signup/signup_screen.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(

            // elevation: 0.0,
            leading: ClipOval(
              child: Container(
                height: 10.h,
                width: 10.w,
                color: kDarkGreen.withOpacity(0.6),
                child: IconButton(
                  hoverColor: Colors.black,
                  color: Colors.grey,
                  icon: Icon(Icons.arrow_back_ios),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            ),
            backgroundColor: Colors.white,
            title: Text(
              "My Cart",
              style: kH1TextStyle,
            )),
        body: Container(),
      ),
    );
  }
}
