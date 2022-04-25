import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:w3/core/constants/colors_constants.dart';
import 'package:w3/ui/custom_widgets/custom_widgets.dart';
import 'package:w3/core/constants/text_style.dart';
import 'package:w3/core/constants/buttons_style.dart';
import 'package:w3/ui/screens/signup/signup_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(top: 20.h, left: 20.w, right: 20.w),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              //circular profile and cart icon
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureCircularAvatar(
                    function: () {},
                    imageUrl: "assets/images/profile_picture.png",
                  ),

                  // gestureDetector for cart icon
                  GestureCircularAvatar(
                    function: () {},
                    child: const Icon(
                      Icons.shopping_cart_outlined,
                    ),
                  ),

                  // cart  circular icon
                ],
              ),

              SizedBox(height: 20.h),

              //Header Text: Lets find your plants!
              Text(
                'Lets find your \nplants!',
                style: kH1TextStyle.copyWith(
                    fontWeight: FontWeight.normal, fontSize: 30.sp),
              ),

              SizedBox(height: 20.h),

              //Search Text Field Find your plants in just a few clicks!
              const CustomTextField(
                prefixIconData: Icons.search,
                hintText: 'Search Plant',
                suffixIconData: Icons.mic,
              ),
            ]),
          ),
        ),
      ),
    );
  }
}

class GestureCircularAvatar extends StatelessWidget {
  const GestureCircularAvatar(
      {Key? key, required this.function, this.child, this.imageUrl})
      : super(key: key);

  final VoidCallback function;
  final Widget? child;
  final imageUrl;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: function,
      child: CircleAvatar(
        backgroundImage: imageUrl == null ? null : AssetImage(imageUrl),
        child: child,
        radius: 20.r,
      ),
    );
  }
}
