
class PreferenceHelper {
  static const userDetails = "user_details";
  static const lessonQuestionDetails = "lesson_question_details";
  static const isFocusMode = "is_focus_mode";

  // static setUserDetails(UserDetails userDetail) async {
  //   await Preferences.setString(userDetails, json.encode(userDetail));
  // }

  // static Future<UserDetails?> getUserDetails() async {
  //   UserDetails? response;
  //   String data = await Preferences.getString(userDetails, null);
  //   if (data != null && data.isNotEmpty) {
  //     response = UserDetails.fromJson(json.decode(data));
  //   }
  //   return response;
  // }

  // static setLessonQuestionDetails(LessonQuestionsResultModel? lessonQuestionsResultModel) async {
  //   await Preferences.setString(lessonQuestionDetails, json.encode(lessonQuestionsResultModel));
  // }

  // static Future<LessonQuestionsResultModel?> getLessonQuestionDetails() async {
  //   LessonQuestionsResultModel? response;
  //   String data = await Preferences.getString(lessonQuestionDetails, null);
  //   if (data != null && data.isNotEmpty && data!='null') {
  //     print('Data: $data');
  //     response = LessonQuestionsResultModel.fromJson(json.decode(data));
  //   }
  //   return response;
  // }

  // static setFocusMode(bool isFocusModeEnable) async {
  //   await Preferences.setBool(isFocusMode, isFocusModeEnable);
  // }

  // static Future<bool> isFocusModeEnable() async {
  //   return await Preferences.getBool(isFocusMode, false);
  // }

  // static Future<void> clearPreference() async {
  //   await Preferences.remove(IS_LOGIN);
  //   await Preferences.remove(ACCESSTOKEN);
  //   await Preferences.remove(REFRESHTOKEN);
  //   await Preferences.remove(USERID);
  //   await Preferences.remove(Mood);
  //   await Preferences.remove(MoodCaptureDate);
  //   await Preferences.remove(userDetails);
  //   await Preferences.remove(isFocusMode);
  // }
}
