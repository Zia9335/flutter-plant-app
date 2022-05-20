import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:w3/ui/custom_widgets/add_to_cart_and_remove_button.dart';
import 'package:w3/core/constants/colors_constants.dart';
import 'package:w3/core/constants/text_style.dart';

class MyCartCards extends StatelessWidget {
  MyCartCards({
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
  final double? plantPrice;

  //final VoidCallback onTapFunction;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 15.h),
      child: Container(
        height: 78.h,
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding:
              EdgeInsets.only(top: 10.h, left: 10.w, bottom: 10.h, right: 5.w),
          child: Row(
            children: [
              // small plant image
              Expanded(
                flex: 2,
                child: Container(
                  width: 80.w,
                  height: 80.h,
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
              ),
              SizedBox(
                width: 15.w,
              ),

              // plant name
              Expanded(
                flex: 6,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // plant name
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          plantNameText,
                          style: TextStyle(
                            color: kDarkGreen,
                            fontFamily: "Poppins",
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),

                        //
                        Padding(
                          padding: EdgeInsets.only(right: 5.w),
                          child: GestureDetector(
                            onTap: () {},
                            child: const Icon(Icons.more_vert),
                          ),
                        ),
                      ],
                    ),

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
                    SizedBox(
                      height: 10.h,
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            AddToCartAndRemoveButton(
                              iconData: Icons.remove,
                              onTap: () {},
                            ),

                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10.w),
                              //
                              child: Container(
                                width: 3.w,
                                height: 10.h,
                                color: kDarkGreen,
                              ),
                            ),

                            //add to cart
                            AddToCartAndRemoveButton(
                              iconData: Icons.add,
                              onTap: () {},
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 10.w),
                          child: Text(
                            "\$$plantPrice",
                            style:
                                plantPriceTextStyle.copyWith(fontSize: 13.sp),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        decoration: BoxDecoration(
          color: kLightenDarkGreenColor,
          borderRadius: BorderRadius.circular(15.0),
          boxShadow: [
            BoxShadow(
              color: kGreen.withOpacity(0.1),
              spreadRadius: 1.r,
              blurRadius: 1.r,
              offset: Offset(0, 2), // changes position of shadow
            ),
          ],
        ),
      ),
    );
  }
}
