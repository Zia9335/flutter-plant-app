import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:w3/core/constants/colors_constants.dart';
import 'package:w3/core/constants/text_style.dart';
import "package:w3/ui/screens/product_details/product_details.dart";

// repeated Gesture Detector CircularAvatar home Screen
class GestureCircularAvatar extends StatelessWidget {
  const GestureCircularAvatar(
      {Key? key,
      required this.function,
      this.child,
      this.imageUrl,
      this.backgroundColor,
      this.radius})
      : super(key: key);

  final VoidCallback function;
  final Widget? child;
  final imageUrl;
  final Color? backgroundColor;
  final double? radius;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: function,
      child: CircleAvatar(
        backgroundColor: backgroundColor,
        backgroundImage: imageUrl == null ? null : AssetImage(imageUrl),
        child: child,
        radius: radius ?? 15.r,
      ),
    );
  }
}

// repeated Recent Viewed Plants Card home Screen
class RecentViewedPlantsCard extends StatelessWidget {
  RecentViewedPlantsCard({
    Key? key,
    required this.plantImageUrl,
    required this.plantNameText,
    required this.plantDiscribText,
    required this.plantPrice,
    // required this.onTapFunction,
  }) : super(key: key);

  // plant image url
  final String plantImageUrl;

  // plant name text
  final String plantNameText;

  // plant type text
  final String plantDiscribText;

  // plant price
  final double plantPrice;

  //final VoidCallback onTapFunction;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print("recentViewedPlantsCard is clicked");
        Navigator.push(context, MaterialPageRoute(builder: ((context) {
          return ProductDeatailsScreen();
        })));
      },
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
  PlantCard({
    Key? key,
    required this.plantImageUrl,
    required this.plantNameText,
    required this.plantTypeText,
    required this.plantPrice,
    // required this.onTapFunction,
  }) : super(key: key);

  // plant image url
  final String plantImageUrl;

  // plant name text
  final String plantNameText;

  // plant type text
  final String plantTypeText;

  // plant price
  final double plantPrice;

  // final VoidCallback onTapFunction;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print("plantCard is clicked");
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: ((context) {
              return ProductDeatailsScreen();
            }),
          ),
        );
      },
      child: SizedBox(
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
                  color: kLightenDarkGreenColor,
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
                  fit: BoxFit.fill,
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
                              style: plantPriceTextStyle,
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
