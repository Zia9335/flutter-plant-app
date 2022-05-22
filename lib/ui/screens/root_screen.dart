import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:w3/core/constants/colors_constants.dart';
import 'package:w3/ui/screens/cart/cart_screen.dart';
import 'package:w3/ui/screens/home/home_screen.dart';

import 'package:w3/ui/screens/menu/menu_Screen.dart';
import 'package:w3/ui/screens/profile/profile_Screen.dart';

class RootScreen extends StatefulWidget {
  const RootScreen({Key? key}) : super(key: key);

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  int _selectedIndex = 0;
  List<Widget> pagesList = [
    HomeScreen(),
    ProfileScreen(),
    CartScreen(),
    MenuScreen(),
  ];

  //button navigation bar items ontab function
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: pagesList[_selectedIndex],

        //bottom navigation bar
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(30.r),
                topLeft: Radius.circular(30.r)),
            boxShadow: [
              BoxShadow(
                  color: kGreen.withOpacity(0.2),
                  spreadRadius: 10.r,
                  blurRadius: 35.r),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30.0.r),
              topRight: Radius.circular(30.0.r),
            ),

            //bottom navigation bar items
            child: BottomNavigationBar(

                //selected item color
                selectedItemColor: kDarkGreen,
                currentIndex: _selectedIndex,
                unselectedItemColor: kDarkGreen.withOpacity(0.5),
                showSelectedLabels: false,
                // type: BottomNavigationBarType.shifting,

                onTap: (value) {
                  _onItemTapped(value);
                },

                //bottom navigation bar items list
                items: const <BottomNavigationBarItem>[
                  //home icon
                  BottomNavigationBarItem(
                    icon: Icon(Icons.home),
                    label: 'Home',
                  ),

                  //Person icon
                  BottomNavigationBarItem(
                    icon: Icon(Icons.person),
                    label: 'Person',
                  ),

                  //shopping cart icon
                  BottomNavigationBarItem(
                    icon: Icon(Icons.shopping_cart),
                    label: 'shopping cart',
                  ),

                  //more icon
                  BottomNavigationBarItem(
                    icon: Icon(Icons.menu),
                    label: 'Menu',
                  ),
                ]),
          ),
        ),
      ),
    );
  }
}
