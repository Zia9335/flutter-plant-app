import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:w3/core/constants/colors_constants.dart';
import '../../core/models/plant_model.dart';

//
class ProductDeatailsListView extends StatelessWidget {
  ProductDeatailsListView({Key? key, required this.plant}) : super(key: key);
  Plant plant;

  List<Widget> list = [
    const ProductDetailsCard(
      lable: "Height",
      icon: Icons.height,
      value: 8.2,
    ),

    //
    const ProductDetailsCard(
      lable: "Humadity",
      icon: Icons.water,
      value: 62,
    ),

    //
    const ProductDetailsCard(
      lable: "unseem",
      icon: Icons.hourglass_empty,
      value: 0.0,
    ),
    const ProductDetailsCard(
      lable: "Height",
      icon: Icons.height,
      value: 8.2,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 35.h,
      child: ListView.builder(
        itemCount: list.length,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        // itemBuilder:
        itemBuilder: (BuildContext context, int index) {
          return list[index];
        },
      ),
    );
  }
}

//
class ProductDetailsCard extends StatelessWidget {
  const ProductDetailsCard({
    required this.lable,
    required this.value,
    required this.icon,
    Key? key,
  }) : super(key: key);

  final double value;
  final String lable;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 10.w),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: kDarkGreen,
            child: Icon(
              icon,
              color: Colors.white,
              size: 20.h,
            ),
            radius: 22.r,
          ),
          SizedBox(
            width: 5.w,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                lable,
                style: TextStyle(color: kGreen, fontSize: 12.sp),
              ),
              SizedBox(
                height: 5.h,
              ),
              Text(
                lable == "Height"
                    ? "$value\""
                    : lable == "Humadity"
                        ? "$value%"
                        : "00",
                style: TextStyle(
                    color: kDarkGreen,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.bold),
              ),
            ],
          )
        ],
      ),
    );
  }
}

// Buy Now button
class BuyNowButton extends StatelessWidget {
  const BuyNowButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0.r),
            ),
          ),
          backgroundColor: MaterialStateProperty.all(kDarkGreen)),
      onPressed: () {},
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.shopping_bag),
            SizedBox(
              width: 10.w,
            ),
            Text("BUY NOW")
          ],
        ),
      ),
    );
  }
}
