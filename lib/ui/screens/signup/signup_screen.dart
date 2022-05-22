import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:w3/ui/custom_widgets/custom_widgets.dart';
import 'package:w3/core/constants/text_style.dart';
import 'package:w3/ui/screens/signup/signup-view-model.dart';
import 'package:provider/provider.dart';
import 'package:w3/ui/screens/login/login_view_model.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key}) : super(key: key);

  double height = 0;
  double width = 0;
  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    final signUpViewModelServices = Provider.of<SignUpValidation>(context);
    // final logninValidationService = Provider.of<LoginValidation>(context);
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
                    CustomTextField(
                      //onchange function
                      function: (String value) {
                        signUpViewModelServices.changeName(value);
                      },
                      prefixIconData: Icons.person,
                      hintText: 'Full Name',
                      errorText: signUpViewModelServices.name.error,
                    ),
                    SizedBox(
                      height: 15.h,
                    ),

                    //Email text field
                    CustomTextField(
                      //onchange function
                      function: (String value) {
                        signUpViewModelServices.changeEmail(value);
                      },
                      prefixIconData: Icons.email,
                      hintText: 'asd123@gmail.com',
                      errorText: signUpViewModelServices.email.error,
                    ),
                    SizedBox(
                      height: 15.h,
                    ),

                    //Password text field
                    CustomTextField(
                      //onchange function
                      function: (String value) {
                        signUpViewModelServices.changePassword(value);
                      },
                      obscureText: true,
                      prefixIconData: Icons.lock,
                      hintText: 'Password',
                      errorText: signUpViewModelServices.password.error,
                    ),
                    SizedBox(
                      height: 15.h,
                    ),

                    //Confirm password text field
                    CustomTextField(
                      //onchange function
                      function: (String value) {
                        signUpViewModelServices.changeConfirmPassword(value);
                      },
                      obscureText: true,
                      prefixIconData: Icons.lock,
                      hintText: 'Confirm Password',
                      errorText: signUpViewModelServices.confirmPassword.error,
                    ),
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
