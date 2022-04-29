import 'package:w3/ui/custom_widgets/home_screen_costum_widgets.dart';
import 'package:w3/ui/screens/cart/cart_screen.dart';
import 'package:w3/ui/screens/product_details/product_details.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:w3/core/constants/colors_constants.dart';
import 'package:w3/ui/custom_widgets/custom_widgets.dart';
import 'package:w3/core/constants/text_style.dart';
import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';

import 'package:w3/core/constants/buttons_style.dart';
import 'package:w3/ui/screens/signup/signup_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
// toggle bar text list
  List<String> labels = ["Apples", "Bananas", "Oranges"];
  List<Tab> listTab = const [
    Tab(
      text: 'Recommended',
    ),
    Tab(
      text: 'Top',
    ),
    Tab(
      text: 'Indoore',
    ),
    Tab(
      text: 'Outdoor',
    ),
  ];

  // plants Card List
  List<Widget> plantsCardList = [
    PlantCard(
      plantImageUrl: 'assets/images/plant1.png',
      plantNameText: "Peace Lily",
      plantTypeText: "Indoor",
      plantPrice: 31.00,
    ),
    PlantCard(
      plantImageUrl: 'assets/images/plant1.png',
      plantNameText: "Peace Lily",
      plantTypeText: "Indoor",
      plantPrice: 31.00,
    ),
    PlantCard(
      plantImageUrl: 'assets/images/plant1.png',
      plantNameText: "Peace Lily",
      plantTypeText: "Indoor",
      plantPrice: 31.00,
    ),
  ];
  List<Widget> RecentViewedPlantsList = [
    RecentViewedPlantsCard(
      plantImageUrl: "assets/images/plant1.png",
      plantNameText: "Calathea",
      plantDiscribText: "Its spines don't grow",
      plantPrice: 0,
    ),
    RecentViewedPlantsCard(
      plantImageUrl: "assets/images/plant1.png",
      plantNameText: "Calathea",
      plantDiscribText: "Its spines don't grow",
      plantPrice: 0,
    ),
    RecentViewedPlantsCard(
      plantImageUrl: "assets/images/plant1.png",
      plantNameText: "Calathea",
      plantDiscribText: "Its spines don't grow",
      plantPrice: 0,
    ),
  ];

  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: listTab.length,
        initialIndex: 0,
        child: Scaffold(
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 20.h, left: 20.w, right: 20.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
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
                            function: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: ((context) => CartScreen())));
                            },
                            backgroundColor: kDarkGreen,
                            child: const Icon(
                              Icons.shopping_cart_outlined,
                              color: Colors.white,
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

                      // toggle bar
                      TabBar(
                        labelStyle: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 10.sp),
                        labelColor: kDarkGreen,
                        unselectedLabelColor: kGrey,
                        isScrollable: true,
                        indicator: BubbleTabIndicator(
                          indicatorHeight: 22.h,
                          indicatorColor: kLightenDarkGreenColor,
                          tabBarIndicatorSize: TabBarIndicatorSize.tab,
                        ),
                        tabs: listTab,
                      ),
                    ],
                  ),
                ),

                //Plants Card List
                SizedBox(
                  height: 200.h,
                  child: ListView.builder(
                    itemCount: plantsCardList.length,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    padding: EdgeInsets.only(left: 20.w),
                    // itemBuilder:
                    itemBuilder: (BuildContext context, int index) {
                      return plantsCardList[index];
                    },
                  ),
                ),

                // Text Recent Viewed
                Padding(
                  padding:
                      EdgeInsets.only(left: 20.0.w, top: 10.h, right: 20.w),
                  child: Text(
                    "Recent Viewed",
                    style: TextStyle(
                        color: kDarkGreen,
                        fontWeight: FontWeight.bold,
                        fontSize: 12.sp),
                  ),
                ),
                SizedBox(
                  height: 100.h,
                  child: ListView.builder(
                    itemCount: RecentViewedPlantsList.length,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    // itemBuilder:
                    itemBuilder: (BuildContext context, int index) {
                      return RecentViewedPlantsList[index];
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// const TabBarView(
//   children: <Widget>[
//     Center(
//       child: Text("It's cloudy here"),
//     ),
//     Center(
//       child: Text("It's rainy here"),
//     ),
//     Center(
//       child: Text("It's sunny here"),
//     ),
//   ],
// ),


