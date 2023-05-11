import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:synkrama_demo/core/prefs/prerences.dart';
import 'package:synkrama_demo/core/providers/signInProvider.dart';
import 'package:synkrama_demo/core/utils/utils.dart';

import '../../../core/constants/color_constants.dart';
import '../../../core/constants/font_family_constants.dart';
import '../../../core/routing/routes.dart';
import '../../../core/widgets/button.dart';
import 'widgets/sign_in_widget.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  String emailError = "";
  String passwordError = "";

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AuthProvider>(context, listen: true);
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.white,
          body: Container(
            padding: EdgeInsets.only(left: 25.h, right: 25.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 40.h),
                  child: Text(
                    "Login In Now!",
                    style: TextStyle(
                        color: ColorConstants.buttonColor,
                        fontSize: 24.sp,
                        fontFamily: FontFamilyConstants.monteserratBold,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(height: 8.h),
                GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, Routes.SignUpRoute);
                    },
                    child:
                        buildRichText("Don't have an account? ", "Sign up!")),
                Form(
                  key: _formKey,
                  child: Container(
                    margin: EdgeInsets.only(top: 30.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        buildTextField(
                            "assets/icons/person(1).png",
                            "Enter Your Email Address",
                            emailController,
                            (val) => {
                                  if (val.length > 3)
                                    {
                                      Provider.of<AuthProvider>(context,
                                              listen: false)
                                          .setEmailError(
                                              Utils.validateEmail(val))
                                    }
                                }),
                        if (provider.emailError.isNotEmpty)
                          Text(
                            provider.emailError,
                            style: const TextStyle(color: Colors.red),
                          ),
                        SizedBox(
                          height: 8.h,
                        ),
                        buildTextField(
                            "assets/icons/lock.png",
                            "Enter Your Password",
                            passwordController,
                            (val) => {
                                  Provider.of<AuthProvider>(context,
                                          listen: false)
                                      .setPasswordError(
                                          Utils.validatePassword(val))
                                }),
                        if (provider.passwordError.isNotEmpty)
                          Text(
                            provider.passwordError,
                            style: const TextStyle(color: Colors.red),
                          ),
                        SizedBox(
                          height: 8.h,
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 8.h),
                          alignment: Alignment.bottomRight,
                          child: Text(
                            "Forgot Password?",
                            style: TextStyle(
                                color: ColorConstants.buttonColor,
                                fontSize: 14.sp,
                                fontFamily: FontFamilyConstants.monteserratBold,
                                fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                const Spacer(),
                buildButton("Sign in", () {
                  validation();
                }),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Center(child: buildLightText("or continue with")),
                      SizedBox(width: 10.w),
                      buildIconButton("assets/icons/google.png", 40),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  validation() {
    print(emailController.text);
    if (emailController.text.isEmpty) {
      Provider.of<AuthProvider>(context, listen: false)
          .setEmailError("Please enter email");
    } else if (passwordController.text.isEmpty) {
      Provider.of<AuthProvider>(context, listen: false)
          .setPasswordError("Please enter password");
    } else {
      print("Success");
      Preferences.setBool('login', true);
    }
  }
}
