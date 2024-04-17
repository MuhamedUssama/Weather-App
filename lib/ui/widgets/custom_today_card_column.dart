import 'package:flutter/material.dart';
import 'package:weather_app/ui/utils/images_constants.dart';

import '../utils/app_theme.dart';

class CustomTodayCardColumn extends StatelessWidget {
  final String degreeText;
  final String timeText;

  const CustomTodayCardColumn(
      {super.key, required this.degreeText, required this.timeText});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(degreeText, style: AppTheme.todayCardColumnText),
        SizedBox(height: height * 0.01),
        Image.asset(
          ImagesURL.todayCardIcon,
          fit: BoxFit.cover,
        ),
        SizedBox(height: height * 0.01),
        Text(timeText, style: AppTheme.todayCardColumnText),
      ],
    );
  }
}
