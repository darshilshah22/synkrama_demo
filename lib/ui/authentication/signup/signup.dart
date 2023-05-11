import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:synkrama_demo/core/constants/constants.dart';
import 'package:synkrama_demo/core/model/userModel.dart';
import 'package:synkrama_demo/core/prefs/preference_helper.dart';
import 'package:synkrama_demo/core/providers/signInProvider.dart';
import 'package:synkrama_demo/core/routing/routes.dart';

import '../../../core/constants/color_constants.dart';
import '../../../core/constants/font_family_constants.dart';
import '../../../core/prefs/prerences.dart';
import '../../../core/utils/utils.dart';
import '../../../core/widgets/button.dart';
import '../signin/widgets/sign_in_widget.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool isCheck = true;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final nameController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    getUsers();
    super.initState();
  }

  getUsers() async {
    usersList = await PreferenceHelper.getUsers() ?? [];
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AuthProvider>(context, listen: true);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: false,
        body: Container(
          padding: EdgeInsets.only(left: 25.h, right: 25.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(top: 40.h),
                child: Text(
                  "Create Your Account!",
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
                    Navigator.pushNamed(context, Routes.SignInRoute);
                  },
                  child: buildRichText("Do you have an account? ", "Sign in!")),
              Container(
                margin: EdgeInsets.only(top: 30.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    buildTextField(
                        "assets/icons/person(1).png",
                        "Enter Your Name",
                        nameController,
                        (val) => {
                              if (val.isNotEmpty)
                                {
                                  Provider.of<AuthProvider>(context,
                                          listen: false)
                                      .setNameError("")
                                }
                            }),
                    if (provider.nameError.isNotEmpty)
                      Text(
                        provider.nameError,
                        style: const TextStyle(color: Colors.red),
                      ),
                    SizedBox(
                      height: 6.h,
                    ),
                    buildTextField(
                        "assets/icons/email.png",
                        "Enter Your Email Address",
                        emailController,
                        (val) => {
                              if (val.length > 3)
                                {
                                  Provider.of<AuthProvider>(context,
                                          listen: false)
                                      .setEmailError(Utils.validateEmail(val))
                                }
                            }),
                    if (provider.emailError.isNotEmpty)
                      Text(
                        provider.emailError,
                        style: const TextStyle(color: Colors.red),
                      ),
                    SizedBox(
                      height: 6.h,
                    ),
                    buildTextField(
                        "assets/icons/lock.png",
                        "Enter Your Password",
                        passwordController,
                        (val) => {
                              Provider.of<AuthProvider>(context, listen: false)
                                  .setPasswordError(Utils.validatePassword(val))
                            }),
                    if (provider.passwordError.isNotEmpty)
                      Text(
                        provider.passwordError,
                        style: const TextStyle(color: Colors.red),
                      ),
                    SizedBox(
                      height: 6.h,
                    ),
                    buildTextField(
                        "assets/icons/lock.png",
                        "Confirm Your Password",
                        confirmPasswordController,
                        (val) => {
                              Provider.of<AuthProvider>(context, listen: false)
                                  .setConfirmPasswordError(
                                      Utils.validateConfirmPass(
                                          passwordController.text, val))
                            }),
                    if (provider.confirmPasswordError.isNotEmpty)
                      Text(
                        provider.confirmPasswordError,
                        style: const TextStyle(color: Colors.red),
                      ),
                    Container(
                      margin: EdgeInsets.only(top: 4.h),
                      child: Row(
                        children: [
                          Checkbox(
                              checkColor: Colors.white,
                              activeColor: ColorConstants.buttonColor,
                              value: provider.isCheck,
                              onChanged: (val) {
                                if (provider.isCheck) {
                                  Provider.of<AuthProvider>(context,
                                          listen: false)
                                      .checkValue(false);
                                } else {
                                  Provider.of<AuthProvider>(context,
                                          listen: false)
                                      .checkValue(true);
                                }
                              }),
                          Text(
                            "Accept Terms and Condition",
                            style: TextStyle(
                                color: isCheck ? Colors.grey : Colors.red,
                                fontSize: 10.sp,
                                fontFamily:
                                    FontFamilyConstants.monteserratRegular,
                                fontWeight: FontWeight.normal),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              const Spacer(),
              buildButton("Sign up", () {
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
    );
  }

  validation() async {
    if (nameController.text.isEmpty) {
      Provider.of<AuthProvider>(context, listen: false)
          .setNameError("Please enter name");
    } else if (emailController.text.isEmpty) {
      Provider.of<AuthProvider>(context, listen: false)
          .setEmailError("Please enter email");
    } else if (passwordController.text.isEmpty) {
      Provider.of<AuthProvider>(context, listen: false)
          .setPasswordError("Please enter password");
    } else if (confirmPasswordController.text.isEmpty) {
      Provider.of<AuthProvider>(context, listen: false)
          .setConfirmPasswordError("Please enter password again");
    } else if (!Provider.of<AuthProvider>(context, listen: false).isCheck) {
      setState(() {
        isCheck = false;
      });
    } else {
      User user = User(
          name: nameController.text,
          email: emailController.text,
          password: passwordController.text);
      usersList.add(user);
      Preferences.setBool('login', true);
      await PreferenceHelper.setUser(user);
      await PreferenceHelper.setUsers(usersList);
      // ignore: use_build_context_synchronously
      Navigator.pushNamedAndRemoveUntil(
          context, Routes.BottomBarRoute, (route) => false);
    }
  }
}
