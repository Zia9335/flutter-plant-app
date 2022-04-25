import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:w3/ui/custom_widgets/custom_widgets.dart';
import 'package:w3/core/constants/text_style.dart';

// ignore: must_be_immutable
class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key}) : super(key: key);

  double height = 0;
  double width = 0;
  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Stack(
            children: [
              //top back arrow icon Button
              CircularBackButton(
                onTapFuction: () {
                  Navigator.pop(context);
                },
              ),

              //small leaves picture
              SmallLeavesPicture(
                positionFromTop: height < 690 ? 20.h : 60.h,
              ),

              Padding(
                padding: EdgeInsets.only(
                    top: 80.h, bottom: 10.h, left: 20.w, right: 20.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    //register header1 text
                    Center(
                      child: Text(
                        'Register',
                        style: kH1TextStyle,
                      ),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),

                    //create your ... header2 text
                    Center(
                      child: Text(
                        'Create your new account',
                        style: kH2TextStyle,
                      ),
                    ),
                    SizedBox(
                      height: 15.h,
                    ),

                    //Full name text Field
                    const CustomTextField(
                        prefixIconData: Icons.person, hintText: 'Full Name'),
                    SizedBox(
                      height: 15.h,
                    ),

                    //Email text field
                    const CustomTextField(
                        prefixIconData: Icons.email,
                        hintText: 'asd123@gmail.com'),
                    SizedBox(
                      height: 15.h,
                    ),

                    //Password text field
                    const CustomTextField(
                        prefixIconData: Icons.lock, hintText: 'Password'),
                    SizedBox(
                      height: 15.h,
                    ),

                    //Confirm password text field
                    const CustomTextField(
                        prefixIconData: Icons.lock,
                        hintText: 'Confirm Password'),
                    SizedBox(
                      height: 15.h,
                    ),

                    /* SignUp Screen Text "By signing you agree to our Team
                          of use and privacy notice"*/
                    RichTextAgreeWithTeamText(),

                    SizedBox(
                      height: height < 690 ? 50.h : 100.h,
                    ),

                    //Sign Up Button
                    CustomElevatedButton(
                        function: () {}, buttonText: 'Sign Up'),

                    SizedBox(
                      height: 10.h,
                    ),

                    //row of last text I have already account Login
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'I have already account ',
                          style: kH2TextStyle,
                        ),

                        //Sign Up detector
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Text(
                            'Login',
                            style: kH3TextStyleSignUpTextInLogInScreen,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
