import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

AppBar buildAppBar() {
  return AppBar(
    centerTitle: true,
    title: Container(
      margin: const EdgeInsets.only(top: 10),
      child: Text(
        "Log In",
        style: TextStyle(
            color: Colors.black, fontSize: 20.sp, fontWeight: FontWeight.bold),
      ),
    ),
  );
}

Widget buildThirdPartyLogin(BuildContext context) {
  return Container(
    margin: EdgeInsets.only(left: 20.w, right: 20.w, top: 20.h, bottom: 16.h),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        buildIconButton("assets/icons/google.png", 40),
        buildIconButton("assets/icons/apple.png", 40),
        buildIconButton("assets/icons/facebook.png", 40),
      ],
    ),
  );
}

Widget buildIconButton(String iconName, double height) {
  return GestureDetector(
    onTap: () {},
    child: SizedBox(
        height: height.w, width: height.w, child: Image.asset(iconName)),
  );
}

Widget buildLightText(String text) {
  return Container(
    margin: EdgeInsets.only(top: 10.h),
    child: Text(
      text,
      style: TextStyle(
          color: Colors.grey.withOpacity(0.5),
          fontSize: 14.sp,
          fontWeight: FontWeight.normal),
    ),
  );
}

Widget buildTextField(String icon, String hint) {
  return Container(
    margin: EdgeInsets.only(top: 8.h),
    padding: EdgeInsets.symmetric(vertical: 6.h, horizontal: 8.w),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.withOpacity(0.5))),
    child: Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        buildIconButton(icon, 20),
        SizedBox(
          width: 10.w,
        ),
        Flexible(
            child: TextFormField(
          decoration: InputDecoration(border: InputBorder.none, hintText: hint),
        )),
      ],
    ),
  );
}
