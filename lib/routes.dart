import 'package:flutter/material.dart';

import 'ui/screens/home/home_screen.dart';
import 'ui/screens/splash/splash_screen.dart';

abstract class AppRoutes {
  static const String initialRoute = SplashScreen.routeName;

  static Map<String, Widget Function(BuildContext)> appRoutes = {
    SplashScreen.routeName: (context) => const SplashScreen(),
    HomeScreen.routeName: (context) => const HomeScreen(),
  };
}
