import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/constants/color_constants.dart';
import '../../core/constants/font_family_constants.dart';

class Orders extends StatelessWidget {
  const Orders({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 40.h, left: 25.w),
        child: Text(
          "Orders",
          style: TextStyle(
              color: ColorConstants.buttonColor,
              fontSize: 24.sp,
              fontFamily: FontFamilyConstants.monteserratBold,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
