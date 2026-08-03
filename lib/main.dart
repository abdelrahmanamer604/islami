import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islami/modules/intro/screens/intro_screen.dart';
import 'package:islami/modules/layout/layout_screen.dart';
import 'package:islami/modules/splash/screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: SplashScreen.routeName,
          routes: {
            SplashScreen.routeName: (_) => const SplashScreen(),
            IntroScreen.routeName: (_) => const IntroScreen(),
            LayoutScreen.routeName: (_) => const LayoutScreen(),
          },
        );
      },
    );
  }
}
