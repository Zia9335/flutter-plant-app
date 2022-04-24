import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:w3/core/constants/colors_constants.dart';

class LoninScreen extends StatelessWidget {
  LoninScreen({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Stack(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            children: [
              ClipPath(
                child: const Image(
                  height: 300,
                  fit: BoxFit.cover,
                  image: AssetImage(
                    'assets/images/green-plants-loginscreen.jpg',
                  ),
                ),
                clipper: _LoginScreenClipper(),
              ),
              Positioned(
                top: 20.h,
                left: 20.h,
                // bottom: 30,
                child: ClipOval(
                  child: Container(
                    height: 25.h,
                    width: 25.h,
                    alignment: Alignment.centerRight,
                    color: Colors.white,
                    child: const Icon(
                      Icons.arrow_back_ios,
                      color: kDarkGreen,
                      size: 20,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _LoginScreenClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, size.height - 50);

    path.quadraticBezierTo(
      size.width / 3,
      size.height,
      size.width,
      size.height - 90,
    );
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
