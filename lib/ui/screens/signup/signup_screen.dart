import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:w3/ui/custom_widgets/custom_widgets.dart';
import 'package:w3/core/constants/text_style.dart';
import 'package:w3/ui/screens/login/login_screen.dart';
import 'package:w3/ui/screens/signup/signup-view-model.dart';

class SignUpScreen extends StatefulWidget {
  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  //

  //
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<SignUpViewModel>(
      create: (context) => SignUpViewModel(),

      //
      child: Consumer<SignUpViewModel>(
        builder: (context, consumerObject, child) => SafeArea(
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
                    positionFromTop: 60.h,
                  ),

                  Padding(
                    padding: EdgeInsets.only(
                        top: 80.h, bottom: 10.h, left: 20.w, right: 20.w),
                    child: Form(
                      key: formKey,
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
                            validation: consumerObject.nameValidation,
                            //onchange function
                            onChanged: consumerObject.setName,
                            prefixIconData: Icons.person,
                            hintText: 'Full Name',
                          ),
                          SizedBox(
                            height: 15.h,
                          ),

                          //Email text field
                          CustomTextField(
                            validation: consumerObject.emailValidation,
                            //onchange function
                            onChanged: consumerObject.setEmail,
                            prefixIconData: Icons.email,
                            hintText: 'asd123@gmail.com',
                          ),
                          SizedBox(
                            height: 15.h,
                          ),

                          //Password text field
                          CustomTextField(
                            validation: consumerObject.passwordValidation,
                            //onchange function
                            onChanged: consumerObject.setPassword,

                            obscureText: true,
                            prefixIconData: Icons.lock,
                            hintText: 'Password',
                          ),
                          SizedBox(
                            height: 15.h,
                          ),

                          //Confirm password text field
                          CustomTextField(
                            validation:
                                consumerObject.confirmedPasswordlValidation,
                            //onchange function
                            onChanged: consumerObject.setConfirmPassword,
                            obscureText: true,
                            prefixIconData: Icons.lock,
                            hintText: 'Confirm Password',
                          ),
                          SizedBox(
                            height: 15.h,
                          ),

                          /* SignUp Screen Text "By signing you agree to our Team
                                of use and privacy notice"*/
                          RichTextAgreeWithTeamText(),

                          SizedBox(
                            height: 100.h,
                          ),

                          //Sign Up Button
                          CustomElevatedButton(
                              onPressed: () {
                                if (formKey.currentState!.validate()) {
                                  print(consumerObject.signUpModel
                                      .toJson()
                                      .toString());

                                  consumerObject.callSignupfunction(context);

                                  // Navigator.pop(context);
                                }
                              },
                              buttonText: 'Sign Up'),

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
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (_) => LoginScreen()));
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
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
