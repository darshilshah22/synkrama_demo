import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:synkrama_demo/core/constants/color_constants.dart';

import '../constants/font_family_constants.dart';

Widget buildButton(String text, VoidCallback func) {
  return GestureDetector(
    onTap: func,
    child: Container(
      width: 325.w,
      height: 50.h,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.w),
          color: ColorConstants.buttonColor,
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                blurRadius: 5,
                spreadRadius: 3,
                offset: const Offset(1, 2))
          ]),
      child: Text(
        text,
        style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontFamily: FontFamilyConstants.monteserratBold,
            fontSize: 20.sp),
      ),
    ),
  );
}
