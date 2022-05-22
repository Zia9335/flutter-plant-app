import 'dart:ffi';

import 'package:provider/provider.dart';
import 'package:w3/ui/custom_widgets/home_screen_costum_widgets.dart';
import 'package:w3/ui/screens/cart/cart-view-model.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:w3/core/constants/colors_constants.dart';
import 'package:w3/ui/custom_widgets/custom_widgets.dart';
import 'package:w3/core/constants/text_style.dart';
import 'package:w3/ui/custom_widgets/my_cart_cards.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return
        //
        Consumer<CartViewModel>(builder: (context, model, child) {
      return SafeArea(
        //
        child: Scaffold(
          body: Stack(children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
              child: Column(
                children: [
                  Row(
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

                      Text("My Cart",
                          style: kH1TextStyle.copyWith(fontSize: 20.sp)),

                      // gestureDetector for cart icon
                      GestureCircularAvatar(
                        function: () {},
                        backgroundColor: Colors.white,
                        child: Icon(
                          Icons.more_vert_sharp,
                          size: 20.h,
                          color: kDarkGreen,
                        ),
                      ),

                      // cart  circular icon
                    ],
                  ),
                  SizedBox(
                    height: 30.h,
                  ),

                  SizedBox(
                    height: 400.h,
                    width: MediaQuery.of(context).size.width,

                    //
                    child: ListView.builder(
                      itemCount: model.cartPlants.length,
                      shrinkWrap: true,

                      // itemBuilder:
                      itemBuilder: (context, index) {
                        return MyCartCards(
                          plant: model.cartPlants[index],
                        );
                      },
                    ),
                  ),

                  //
                ],
              ),
            ),

            //
            SizedBox.expand(
              child: DraggableScrollableSheet(
                initialChildSize: 0.3,
                minChildSize: 0.13,
                maxChildSize: 0.9,
                builder:
                    (BuildContext context, ScrollController scrollController) {
                  return Container(
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(20, 40, 20, 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            //subtotal
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Subtotal:",
                                  style: kH2TextStyleWithDarkGreen,
                                ),
                                Text(
                                  "\$${Provider.of<CartViewModel>(context).subtotalDollers()}",
                                  style: kH2TextStyleWithDarkGreen,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10.h,
                            ),

                            //shipping cost
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Shipping Cost:",
                                  style: kH2TextStyleWithDarkGreen,
                                ),
                                Text(
                                  "\$10.00",
                                  style: kH2TextStyleWithDarkGreen,
                                ),
                              ],
                            ),

                            //divider
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 20.h),
                              child: Container(
                                height: 2.h,
                                decoration: BoxDecoration(
                                  color: kGrey.withOpacity(0.2),
                                  borderRadius: BorderRadius.circular(5.r),
                                  boxShadow: [
                                    BoxShadow(
                                        color: kGrey.withOpacity(0.2),
                                        blurRadius: 0.1,
                                        spreadRadius: 0.3),
                                  ],
                                ),
                              ),
                            ),

                            //total
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Total:",
                                  style: kH1TextStyle.copyWith(fontSize: 20.sp),
                                ),
                                Text(
                                  "\$${Provider.of<CartViewModel>(context).subtotalDollers() + 10}",
                                  style: kH1TextStyle.copyWith(fontSize: 20.sp),
                                ),
                              ],
                            ),

                            SizedBox(
                              height: 10.h,
                            ),

                            CustomElevatedButton(
                              function: () {},
                              borderRadiusGeometry:
                                  BorderRadius.circular(10.0.r),
                              buttonText: "Place your order",
                            ),
                          ],
                        ),
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
    });
  }
}
