import 'package:flutter/material.dart';

import '../utils/app_theme.dart';
import '../utils/images_constants.dart';

class SubWeatherInfoWidget extends StatelessWidget {
  final String rainText;
  final String tempText;
  final String windText;

  const SubWeatherInfoWidget({
    super.key,
    required this.rainText,
    required this.tempText,
    required this.windText,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Row(
          children: [
            Image.asset(ImagesURL.rainIcon),
            Text("$rainText%", style: AppTheme.subWeatherInfo),
          ],
        ),
        Row(
          children: [
            Image.asset(ImagesURL.tempIcon),
            Text("$tempText%", style: AppTheme.subWeatherInfo),
          ],
        ),
        Row(
          children: [
            Image.asset(ImagesURL.windIcon),
            Text(" $windText Km/h", style: AppTheme.subWeatherInfo),
          ],
        ),
      ],
    );
  }
}
