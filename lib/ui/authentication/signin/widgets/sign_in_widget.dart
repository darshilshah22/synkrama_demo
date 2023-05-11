import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/color_constants.dart';
import '../../../../core/constants/font_family_constants.dart';

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

Widget buildIconButton(String iconName, double height) {
  return GestureDetector(
    onTap: () {},
    child: SizedBox(
        height: height.w, width: height.w, child: Image.asset(iconName)),
  );
}

Widget buildLightText(String text) {
  return Text(
    text,
    style: TextStyle(
        color: Colors.grey, fontSize: 14.sp, fontWeight: FontWeight.normal),
  );
}

Widget buildTextField(String icon, String hint,
    TextEditingController controller, Function(String) onChanged) {
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
              controller: controller,
          onChanged: onChanged,
          decoration: InputDecoration(border: InputBorder.none, hintText: hint),
        )),
      ],
    ),
  );
}

Widget buildRichText(String text, String subText) {
  return RichText(
    text: TextSpan(
        text: text,
        style: TextStyle(
            color: Colors.grey.withOpacity(0.8),
            fontSize: 12.sp,
            fontFamily: FontFamilyConstants.monteserratRegular,
            fontWeight: FontWeight.normal),
        children: [
          TextSpan(
              text: subText,
              style: TextStyle(
                  color: ColorConstants.buttonColor,
                  fontSize: 12.sp,
                  fontFamily: FontFamilyConstants.monteserratBold,
                  fontWeight: FontWeight.bold))
        ]),
  );
}
