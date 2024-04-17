import 'package:flutter/material.dart';

import '../utils/app_theme.dart';

class DegreeInfo extends StatelessWidget {
  final String mainDgree;
  final String maxDgree;
  final String minDgree;

  const DegreeInfo(
      {super.key,
      required this.mainDgree,
      required this.maxDgree,
      required this.minDgree});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Column(
      children: [
        Text(
          mainDgree,
          style: AppTheme.mainWeatherDegree,
        ),
        SizedBox(height: height * 0.001),
        const Text(
          "Precipitations",
          style: AppTheme.maxAndMinInfoDegree,
        ),
        Text(
          "Max..: $maxDgree    Min..: $minDgree",
          style: AppTheme.maxAndMinInfoDegree,
        ),
      ],
    );
  }
}
