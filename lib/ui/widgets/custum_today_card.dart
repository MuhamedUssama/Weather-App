import 'package:flutter/material.dart';
import 'package:weather_app/ui/utils/app_theme.dart';

import 'custom_today_card_column.dart';

class CustomTodayCard extends StatelessWidget {
  final String dateOfToday;
  final String degreeText1;
  final String timeText1;
  final String degreeText2;
  final String timeText2;
  final String degreeText3;
  final String timeText3;
  final String degreeText4;
  final String timeText4;
  const CustomTodayCard({
    super.key,
    required this.dateOfToday,
    required this.degreeText1,
    required this.timeText1,
    required this.degreeText2,
    required this.timeText2,
    required this.degreeText3,
    required this.timeText3,
    required this.degreeText4,
    required this.timeText4,
  });

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Today", style: AppTheme.todayWord),
            Text(dateOfToday, style: AppTheme.dateOfToday),
          ],
        ),
        SizedBox(height: height * 0.04),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomTodayCardColumn(degreeText: degreeText1, timeText: timeText1),
            CustomTodayCardColumn(degreeText: degreeText2, timeText: timeText2),
            CustomTodayCardColumn(degreeText: degreeText3, timeText: timeText3),
            CustomTodayCardColumn(degreeText: degreeText4, timeText: timeText4),
          ],
        ),
        SizedBox(height: height * 0.02),
      ],
    );
  }
}
