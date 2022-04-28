import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:w3/ui/custom_widgets/product_details_custom_widgets.dart';
import 'package:w3/ui/custom_widgets/custom_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:w3/core/constants/colors_constants.dart';
import 'package:w3/core/constants/text_style.dart';
import 'package:w3/ui/custom_widgets/home_screen_costum_widgets.dart';

//
class ProductDeatailsScreen extends StatefulWidget {
  const ProductDeatailsScreen({Key? key}) : super(key: key);

  @override
  State<ProductDeatailsScreen> createState() => _ProductDeatailsScreenState();
}

class _ProductDeatailsScreenState extends State<ProductDeatailsScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: kTextFieldFilledColor,
        body: Stack(children: [
          Positioned(
            top: 20.h,
            left: 20.w,
            right: 20.w,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // gestureDetector for back
                GestureCircularAvatar(
                  function: () {
                    Navigator.pop(context);
                  },
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.arrow_back_ios,
                    color: kGrey,
                    size: 20.sp,
                  ),
                ),
                // gestureDetector for cart icon
                GestureCircularAvatar(
                  function: () {},
                  backgroundColor: kDarkGreen.withOpacity(0.7),
                  child: Icon(
                    Icons.favorite_border_outlined,
                    size: 20.h,
                    color: Colors.white,
                  ),
                ),

                // cart  circular icon
              ],
            ),
          ),
          Positioned(
            top: 40.h,
            left: 30.w,
            right: 30.w,
            child: Image(
              height: 450.h,
              width: 250.w,
              image: AssetImage('assets/images/plant1.png'),
            ),
          ),
          SizedBox.expand(
            child: DraggableScrollableSheet(
              initialChildSize: 0.42,
              minChildSize: 0.13,
              maxChildSize: 0.9,
              builder:
                  (BuildContext context, ScrollController scrollController) {
                return Container(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              top: 30.h, left: 20.w, right: 20.w, bottom: 10.h),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Schefflera',
                                        style: kH1TextStyle.copyWith(
                                            fontSize: 20.sp),
                                      ),
                                      Row(
                                        children: [
                                          Text("\$25.00",
                                              style: kH2TextStyle.copyWith(
                                                  color: kGreen,
                                                  fontWeight: FontWeight.bold)),
                                          SizedBox(
                                            width: 5.w,
                                          ),
                                          Icon(
                                            Icons.star,
                                            color: Colors.yellow,
                                            size: 15.h,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          color: kDarkGreen,
                                          borderRadius:
                                              BorderRadius.circular(20.r),
                                        ),
                                        height: 25.h,
                                        width: 90.w,
                                        child: Center(
                                          child: Row(
                                            children: [
                                              Expanded(
                                                child: IconButton(
                                                    onPressed: null,
                                                    icon: Icon(
                                                      Icons.remove,
                                                      color: Colors.white,
                                                      size: 12.h,
                                                    )),
                                              ),
                                              const Expanded(
                                                  child: Center(
                                                      child: Text(
                                                '10',
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ))),
                                              Expanded(
                                                child: IconButton(
                                                    onPressed: null,
                                                    icon: Icon(
                                                      Icons.add,
                                                      color: Colors.white,
                                                      size: 12.h,
                                                    )),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 20.h,
                              ),
                              Text("About",
                                  style:
                                      kH1TextStyle.copyWith(fontSize: 14.sp)),
                              Text(
                                "However, they look like huge white flowers and they bloom throughout the year and a bit more frequently in the springtime. This coupied with plant's brood, deep green leaves.",
                                style: TextStyle(
                                  fontSize: 10.sp,
                                  height: 1.5.h,
                                  color: kDarkGreen,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 20.w),
                          child: ProductDeatailsListView(),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 20.w, vertical: 20.h),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureCircularAvatar(
                                  function: () {},
                                  radius: 20.r,
                                  child: const Icon(
                                    Icons.shopping_cart,
                                    color: kDarkGreen,
                                  ),
                                  backgroundColor: kLightGreenAccent),
                              SizedBox(
                                width: 10.w,
                              ),
                              Expanded(
                                child: BuyNowButton(),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),

                  // container decoration
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(40.r),
                          topRight: Radius.circular(40.r))),
                );
              },
            ),
          ),
        ]),
      ),
    );
  }
}
