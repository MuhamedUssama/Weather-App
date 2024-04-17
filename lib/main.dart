import 'package:flutter/material.dart';
import 'package:weather_app/di/di.dart';
import 'package:weather_app/routes.dart';
import 'package:weather_app/ui/utils/app_theme.dart';

void main() {
  configureDependencies();
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather App',
      debugShowCheckedModeBanner: false,
      // themeMode: ,
      theme: AppTheme.lightThemeData,
      routes: AppRoutes.appRoutes,
      initialRoute: AppRoutes.initialRoute,
    );
  }
}
