import 'package:flutter/material.dart';
import 'package:weather_app/ui/utils/app_colors.dart';
import 'package:weather_app/ui/widgets/degree_info.dart';

import '../../utils/images_constants.dart';
import '../../widgets/custum_today_card.dart';
import '../../widgets/sub_weather_info_widget.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = 'HomeScreen';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: width * 0.04, vertical: height * 0.04),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.location_on_outlined,
                        color: Colors.white,
                      ),
                      SizedBox(width: width * 0.02),
                      const Text(
                        "Cairo",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(width: width * 0.01),
                      const Icon(
                        Icons.arrow_drop_down,
                        color: Colors.white,
                      ),
                    ],
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.settings,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              Container(
                height: height * 0.3,
                width: width * 0.5,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(ImagesURL.splashScreen),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const DegreeInfo(mainDgree: "30", maxDgree: "34", minDgree: "28"),
              SizedBox(height: height * 0.04),
              Container(
                width: double.infinity,
                height: height * 0.08,
                decoration: BoxDecoration(
                  color: AppColors.lightOpacityColor.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: const SubWeatherInfoWidget(
                  rainText: "18",
                  tempText: "67",
                  windText: "25",
                ),
              ),
              SizedBox(height: height * 0.04),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppColors.lightOpacityColor.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: const CustomTodayCard(
                  dateOfToday: "Mar, 16",
                  degreeText1: "31 ْ",
                  timeText1: "15.00",
                  degreeText2: "30 ْ",
                  timeText2: "16.00",
                  degreeText3: "28 ْ",
                  timeText3: "17.00",
                  degreeText4: "29 ْ",
                  timeText4: "18.00",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
