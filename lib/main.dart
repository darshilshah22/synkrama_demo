import 'package:flutter/material.dart';

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
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(builder: (context, child) {
      return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
                appBarTheme:
                    const AppBarTheme(elevation: 0, backgroundColor: Colors.white)),
          initialRoute: Routes.SignInRoute,
          onGenerateRoute: PageRouter.generateRoute);
    });
  }
}
