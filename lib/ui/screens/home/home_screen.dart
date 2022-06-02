import 'package:provider/provider.dart';
import 'package:w3/core/services/database_services.dart';
import 'package:w3/ui/custom_widgets/home_screen_costum_widgets.dart';
import 'package:w3/ui/screens/cart/cart-view-model.dart';
import 'package:w3/ui/screens/cart/cart_screen.dart';
import 'package:w3/ui/screens/home/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:w3/core/constants/colors_constants.dart';
import 'package:w3/ui/custom_widgets/custom_widgets.dart';
import 'package:w3/core/constants/text_style.dart';
import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
import 'package:badges/badges.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
// toggle bar text list

  @override
  void initState() {
    super.initState();
    Provider.of<HomeViewModel>(context, listen: false).callData;
    Provider.of<CartViewModel>(context, listen: false).callData;
  }

  @override
  Widget build(BuildContext context) {
    //
    return Consumer<HomeViewModel>(
      builder: (context, model, child) {
        return SafeArea(
          //
          child: DefaultTabController(
            length: model.tabsList.length,
            initialIndex: 0,
            child: Scaffold(
              body: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          EdgeInsets.only(top: 20.h, left: 20.w, right: 20.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //circular profile and cart icon
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureCircularAvatar(
                                function: () {
                                  // Provider.of<DatabaseServices>(context,
                                  //         listen: false)
                                  //     .sendDataToFirestore();
                                  model.callData;
                                },
                                imageUrl: "assets/images/profile_picture.png",
                              ),

                              // gestureDetector for cart icon
                              Badge(
                                showBadge: Provider.of<CartViewModel>(
                                          context,
                                        ).itemCount <=
                                        0
                                    ? false
                                    : true,
                                badgeColor: Colors.blueAccent,
                                animationType: BadgeAnimationType.fade,
                                badgeContent: Text(
                                  Provider.of<CartViewModel>(
                                    context,
                                  ).itemCount.toString(),
                                  style: kH1TextStyle.copyWith(
                                      color: Colors.white, fontSize: 12.sp),
                                ),
                                child: GestureCircularAvatar(
                                  function: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: ((context) =>
                                                CartScreen())));
                                  },
                                  backgroundColor: kDarkGreen,
                                  child: const Icon(
                                    Icons.shopping_cart_outlined,
                                    color: Colors.white,
                                  ),
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
                          CustomTextField(
                            //onchange function
                            onChanged: (String value) {
                              //validationService.changeEmail(value);
                            },
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
                            tabs: model.tabsList,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 400.h,
                      child: TabBarView(
                        children: <Widget>[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              //Plants Card List
                              SizedBox(
                                height: 200.h,

                                //
                                child: ListView.builder(
                                  itemCount: model.plants.length,
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  padding: EdgeInsets.only(left: 20.w),
                                  // itemBuilder:
                                  itemBuilder: (context, index) {
                                    return PlantCard(model.plants[index]);
                                  },
                                ),
                              ),

                              // Text Recent Viewed
                              Padding(
                                padding: EdgeInsets.only(
                                    left: 20.0.w, top: 10.h, right: 20.w),
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
                                  itemCount: model.recentViewedPlant.length,
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  // itemBuilder:
                                  itemBuilder: (context, index) {
                                    return RecentViewedPlantsCard(
                                        plant: model.recentViewedPlant[index]);
                                  },
                                ),
                              ),
                            ],
                          ),
                          const Center(
                            child: Text("Top"),
                          ),
                          const Center(
                            child: Text("Indoore"),
                          ),
                          const Center(
                            child: Text("Outdoor"),
                          ),
                          const Center(
                            child: Text("small"),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
