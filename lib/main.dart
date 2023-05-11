import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:synkrama_demo/core/constants/font_family_constants.dart';
import 'package:synkrama_demo/core/prefs/prerences.dart';
import 'package:synkrama_demo/core/providers/signInProvider.dart';
import 'package:synkrama_demo/ui/authentication/signin/signIn.dart';
import 'package:synkrama_demo/ui/pages/bottomNavigation.dart';

import 'core/constants/color_constants.dart';
import 'core/routing/router.dart';
import 'core/routing/routes.dart';
import "package:flutter_screenutil/flutter_screenutil.dart";

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const FlutterBaseApp());
}

class FlutterBaseApp extends StatefulWidget {
  const FlutterBaseApp({super.key});

  @override
  State<FlutterBaseApp> createState() => _FlutterBaseAppState();
}

class _FlutterBaseAppState extends State<FlutterBaseApp> {
  bool isLogin = false;

  @override
  void initState() {
    getLoginCheck();
    super.initState();
  }

  getLoginCheck() async {
    isLogin = await Preferences.getBool("login");
    print(isLogin);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => AuthProvider())],
      child: ScreenUtilInit(builder: (context, child) {
        return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
                fontFamily: FontFamilyConstants.monteserratRegular,
                appBarTheme: const AppBarTheme(
                    elevation: 0, backgroundColor: Colors.white)),
            // initialRoute: !isLogin ? Routes.SignInRoute : Routes.BottomBarRoute,
            home: isLogin ? const BottomNavigationTabs() : const SignIn(),
            onGenerateRoute: PageRouter.generateRoute);
      }),
    );
  }
}
