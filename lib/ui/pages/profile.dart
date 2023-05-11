import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:synkrama_demo/core/constants/constants.dart';
import 'package:synkrama_demo/core/prefs/preference_helper.dart';
import 'package:synkrama_demo/core/prefs/prerences.dart';
import 'package:synkrama_demo/core/routing/routes.dart';
import 'package:synkrama_demo/core/widgets/button.dart';

import '../../core/constants/color_constants.dart';
import '../../core/constants/font_family_constants.dart';
import '../../core/model/userModel.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  User? user;

  getUser() async {
    user = await PreferenceHelper.getUser();
    usersList = await PreferenceHelper.getUsers() ?? [];
    setState(() {});
    print(usersList.length);
  }

  @override
  void initState() {
    getUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Container(
          alignment: Alignment.topLeft,
          margin: EdgeInsets.only(top: 40.h, left: 25.w),
          child: Text(
            "Profile",
            style: TextStyle(
                color: ColorConstants.buttonColor,
                fontSize: 24.sp,
                fontFamily: FontFamilyConstants.monteserratBold,
                fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(height: 50.h),
        const Center(
          child: CircleAvatar(
            backgroundColor: Colors.grey,
            backgroundImage: AssetImage("assets/images/img5.png"),
            radius: 80,
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 10.h),
          child: Text(
            user!.name ?? "Darshil Shah",
            style: TextStyle(
                color: ColorConstants.buttonColor,
                fontSize: 14.sp,
                fontFamily: FontFamilyConstants.monteserratBold,
                fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 10.h),
          child: Text(
            user!.email ?? "darshil@gmail.com",
            style: TextStyle(
                color: ColorConstants.buttonColor,
                fontSize: 14.sp,
                fontFamily: FontFamilyConstants.monteserratBold,
                fontWeight: FontWeight.bold),
          ),
        ),
        Spacer(),
        buildButton("Logout", () async {
          await PreferenceHelper.clearPreference();
          Navigator.pushNamedAndRemoveUntil(
              context, Routes.SignInRoute, (route) => false);
        }),
        SizedBox(height: 20.h)
      ]),
    );
  }
}
