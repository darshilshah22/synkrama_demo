// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:task_management/core/constants/constants.dart';

// class Utils {
//   static String getTimeLabelFromSeconds(int seconds) {
//     //int minutes=(seconds/60).toInt();
//     int minutes = seconds ~/ 60;
//     int sec = seconds - (minutes * 60);
//     return '${minutes}m ${sec}s';
//   }

//   static String getHourLabelFromSeconds(int seconds) {
//     int hours = seconds ~/ (60 * 60);
//     return '${hours}h';
//   }

//   static String getMinutesAndSecondLableFromSeconds(int seconds) {
//     int hours = seconds ~/ (60 * 60);
//     int minutes = (seconds ~/ 60) - (hours * 60);
//     int sec = seconds - (minutes * 60) - (hours * 60 * 60);
//     return '${minutes}m ${sec}s';
//   }

//   static String getCurrentTimeStamp() {
//     String dateTime = new DateFormat(TIME_STAMP_FORMAT).format(DateTime.now());
//     return dateTime;
//   }

//   static void removeFocus(BuildContext context) {
//     FocusScopeNode currentFocus = FocusScope.of(context);
//     if (!currentFocus.hasPrimaryFocus) {
//       currentFocus.unfocus();
//     }
//   }

//   static String getExpiredMonth(String expiredDate) {
//     DateTime expiredDateTime =
//         DateFormat(MMM_DD_YYYY_HH_MM_FORMAT).parse(expiredDate);
//     // DateTime expiredDateTime = DateTime.parse(expiredDate);
//     Duration duration = expiredDateTime.difference(DateTime.now());
//     String durationInMonth = (duration.inDays / 30).floor().toString();
//     return ("Expires in " + durationInMonth + " months");
//   }

//   static String getExpiredMonth1(String expiredDate) {
//     DateTime expiredDateTime = DateFormat(TIME_STAMP_FORMAT).parse(expiredDate);
//     Duration duration = expiredDateTime.difference(DateTime.now());
//     String durationInMonth = (duration.inDays / 30).floor().toString();
//     return ("Expires in " + durationInMonth + " months");
//   }

//   static String getFormattedDate(String createdAt) {
//     DateTime createdAtDateTime = DateFormat(TIME_STAMP_FORMAT).parse(createdAt);
//     String date = DateFormat(DD_MMM_YYYY_FORMAT).format(createdAtDateTime);
//     return date;
//   }

//   static String getBenchMarkTimeFormat(String createdAt) {
//     DateTime createdAtDateTime = DateFormat(TIME_STAMP_FORMAT).parse(createdAt);
//     String date =
//         DateFormat(DD_MMM_YYYY_HH_MM_FORMAT).format(createdAtDateTime);
//     return date;
//   }

//   static String getBackground() {
//     switch (globals.mood) {
//       case 0:
//         return ImageConstants.moodTerribleBg;
//       case 1:
//         return ImageConstants.moodIMOkayBg;
//       case 2:
//         return ImageConstants.moodAwesomeBg;
//       default:
//         return ImageConstants.moodIMOkayBg;
//     }
//   }

//   static bool validateEmail(String value) {
//     String pattern =
//         r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
//     RegExp regex = new RegExp(pattern);
//     return (!regex.hasMatch(value)) ? false : true;
//   }

//   static String getCurrentTimestamp() {
//     return DateTime.now().toString().replaceAll(' ', 'T');
//   }

//   static Color getSelectedIndicatorColor(int index, int pageCount) {
//     if (index <= pageCount - 1) {
//       return Color(ColorConstants.black_10);
//     }
//     return Colors.grey;
//   }

//   static String prepareName(UserDetails userDetails) {
//     String name = '';
//     if (userDetails != null) {
//       if (userDetails.firstName != null) {
//         name = userDetails.firstName! + " ";
//       }
//       if (userDetails.lastName != null) {
//         name = name + userDetails.lastName!;
//       }
//     }
//     return name;
//   }

//   static Future<String> getToken() async {
//     String token = Bearer + await Preferences.getString(ACCESSTOKEN, "");
//     return token;
//   }

//   static void exitApp() {
//     SystemChannels.platform.invokeMethod('SystemNavigator.pop');
//   }

//   static void share(String link) async {
//     await Share.share(link);
//   }
// }
class Utils {
  static String validateEmail(String value) {
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = RegExp(pattern);
    return (!regex.hasMatch(value)) ? "Please Enter Valid Email" : "";
  }

  static String validatePassword(String value) {
    return value.length < 6 ? "Password length must be more than 6" : "";
  }

  static String validateConfirmPass(String password, String cPass) {
    return password != cPass
        ? "Password and Confirm Password must be same"
        : "";
  }
}
