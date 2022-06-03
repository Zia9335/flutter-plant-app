import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:w3/core/models/plant_model.dart';
import 'package:w3/ui/custom_widgets/add_to_cart_and_remove_button.dart';
import 'package:w3/core/constants/colors_constants.dart';
import 'package:w3/core/constants/text_style.dart';
import 'package:w3/ui/screens/cart/cart-view-model.dart';

class MyCartCards extends StatelessWidget {
  const MyCartCards({
    Key? key,
    required this.plant,

    // required this.onTapFunction,
  }) : super(key: key);

  final Plant plant;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CartViewModel(),
      child: Consumer<CartViewModel>(
        builder: (context, consumerOdject, child) => Padding(
          padding: EdgeInsets.only(bottom: 15.h),
          child: Container(
            height: 78.h,
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: EdgeInsets.only(
                  top: 10.h, left: 10.w, bottom: 10.h, right: 5.w),
              child: Row(
                children: [
                  // small plant image
                  Expanded(
                    flex: 2,
                    child: Badge(
                      badgeColor: Colors.blueAccent,
                      badgeContent: Text(
                        plant.quantity.toString(),
                        style: TextStyle(
                          fontSize: 10.sp,
                          color: Colors.white,
                        ),
                      ),
                      child: Container(
                        width: 80.w,
                        height: 80.h,
                        child: Center(
                          child: Image.asset(
                            plant.imageUrl,
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
                              plant.name,
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
                              child: SizedBox(
                                height: 20.h,
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton(
                                    icon: Icon(Icons.more_vert),
                                    items: [
                                      DropdownMenuItem(
                                        onTap: (() {
                                          consumerOdject
                                              .deletePlantFromCart(plant);
                                        }),
                                        child: Text("delete"),
                                        value: "delete",
                                      ),
                                    ],
                                    onChanged: (value) {},
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),

                        // plant discription
                        Text(
                          plant.slogans,
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
                                  onTap: () {
                                    consumerOdject.quantityDecrement(plant);
                                  },
                                ),

                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 10.w),
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
                                  onTap: () {
                                    consumerOdject.quantityIncrement(plant);
                                  },
                                ),
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.only(right: 10.w),
                              child: Text(
                                "\$ ${plant.price * Provider.of<CartViewModel>(context).returnItemCount(plant)}",
                                style: plantPriceTextStyle.copyWith(
                                    fontSize: 13.sp),
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
        ),
      ),
    );
  }
}
