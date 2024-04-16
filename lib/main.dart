import 'package:flutter/material.dart';
import 'package:weather_app/routes.dart';

void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather App',
      debugShowCheckedModeBanner: false,
      routes: AppRoutes.appRoutes,
      initialRoute: AppRoutes.initialRoute,
    );
  }
}
