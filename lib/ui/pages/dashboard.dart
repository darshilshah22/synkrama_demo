import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:synkrama_demo/core/constants/constants.dart';

import '../../core/constants/color_constants.dart';
import '../../core/constants/font_family_constants.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  String listType = "Horizontal";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 25.0, right: 25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(top: 40.h),
              child: Text(
                "Dashboard",
                style: TextStyle(
                    color: ColorConstants.buttonColor,
                    fontSize: 24.sp,
                    fontFamily: FontFamilyConstants.monteserratBold,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 20.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      listType = "Horizontal";
                    });
                  },
                  child: Text(
                    "Horizontal",
                    style: TextStyle(
                        color: listType == "Horizontal"
                            ? ColorConstants.buttonColor
                            : Colors.grey,
                        fontSize: 18.sp,
                        fontFamily: FontFamilyConstants.monteserratBold,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      listType = "Vertical";
                    });
                  },
                  child: Text(
                    "Vertical",
                    style: TextStyle(
                        color: listType == "Vertical"
                            ? ColorConstants.buttonColor
                            : Colors.grey,
                        fontSize: 18.sp,
                        fontFamily: FontFamilyConstants.monteserratBold,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      listType = "Grid";
                    });
                  },
                  child: Text(
                    "Grid",
                    style: TextStyle(
                        color: listType == "Grid"
                            ? ColorConstants.buttonColor
                            : Colors.grey,
                        fontSize: 18.sp,
                        fontFamily: FontFamilyConstants.monteserratBold,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.h),
            if (listType == "Vertical")
              Expanded(
                child: ListView.builder(
                    itemCount: imageList.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Container(
                          width: 200.w,
                          margin: EdgeInsets.only(bottom: 10.h),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: Colors.black38)),
                          child: Image.asset(imageList[index]));
                    }),
              ),
            if (listType == "Horizontal")
              SizedBox(
                height: 150.h,
                child: ListView.builder(
                    itemCount: imageList.length,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Container(
                          width: 150.w,
                          margin: EdgeInsets.only(right: 10.w),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: Colors.black38)),
                          child: Image.asset(imageList[index]));
                    }),
              ),
            if (listType == "Grid")
              Expanded(
                child: GridView.builder(
                    itemCount: imageList.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 8,
                      mainAxisSpacing: 8,
                      childAspectRatio: (2 / 1),
                    ),
                    itemBuilder: (context, index) {
                      return Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: Colors.black38)),
                          child: Image.asset(imageList[index]));
                    }),
              )
          ],
        ),
      ),
    );
  }
}
