import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/widgets/button.dart';
import 'widgets/sign_in_widget.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Login In Now",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 24.sp,
                    fontWeight: FontWeight.bold),
              ),
              Container(
                margin: EdgeInsets.only(top: 40.h),
                padding: EdgeInsets.only(left: 25.w, right: 25.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    buildLightText("Email"),
                    buildTextField("assets/icons/person(1).png",
                        "Enter Your Email Address"),
                    SizedBox(
                      height: 8.h,
                    ),
                    buildTextField(
                        "assets/icons/lock.png", "Enter Your Password"),
                  ],
                ),
              ),
              const Spacer(),
              buildButton("Login", () {}),
              Center(child: buildLightText("or login with social accounts")),
              buildThirdPartyLogin(context),
            ],
          ),
        ),
      ),
    );
  }
}
