import 'package:flutter/material.dart';
import 'package:weather_app/ui/utils/app_colors.dart';

abstract class AppTheme {
  static ThemeData lightThemeData = ThemeData(
    scaffoldBackgroundColor: AppColors.lightPrimaryColor,
  );
  static TextStyle mainWeatherDegree = TextStyle(
    color: Colors.white,
    fontSize: 64,
    fontWeight: FontWeight.bold,
    shadows: [
      Shadow(
        color: Colors.grey.withOpacity(0.5),
        offset: const Offset(2.0, 2.0),
        blurRadius: 3.0,
      ),
    ],
  );
  static const TextStyle maxAndMinInfoDegree = TextStyle(
    color: Colors.white,
    fontSize: 16,
    fontWeight: FontWeight.w400,
  );
  static const TextStyle subWeatherInfo = TextStyle(
    color: Colors.white,
    fontSize: 20,
    fontWeight: FontWeight.w600,
  );
  static TextStyle todayWord = TextStyle(
    color: Colors.white,
    fontSize: 24,
    fontWeight: FontWeight.w700,
    shadows: [
      Shadow(
        color: Colors.grey.withOpacity(0.5),
        offset: const Offset(2.0, 2.0),
        blurRadius: 3.0,
      ),
    ],
  );
  static TextStyle dateOfToday = TextStyle(
    color: Colors.white,
    fontSize: 20,
    fontWeight: FontWeight.w400,
    shadows: [
      Shadow(
        color: Colors.grey.withOpacity(0.4),
        offset: const Offset(2.0, 2.0),
        blurRadius: 3.0,
      ),
    ],
  );
  static TextStyle todayCardColumnText = TextStyle(
    color: Colors.white,
    fontSize: 20,
    fontWeight: FontWeight.w500,
    shadows: [
      Shadow(
        color: Colors.grey.withOpacity(0.4),
        offset: const Offset(2.0, 2.0),
        blurRadius: 3.0,
      ),
    ],
  );
}
