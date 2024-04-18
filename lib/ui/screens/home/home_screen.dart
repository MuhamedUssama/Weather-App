import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/di/di.dart';
import 'package:weather_app/ui/screens/home/cubits/current_weather/current_weather_cubit.dart';
import 'package:weather_app/ui/screens/home/cubits/weather_location/weather_location_cubit.dart';
import 'package:weather_app/ui/screens/home/cubits/weather_location/weather_location_state.dart';

import 'package:weather_app/ui/utils/app_colors.dart';
import 'package:weather_app/ui/utils/images_constants.dart';
import 'package:weather_app/ui/widgets/degree_info.dart';
import 'package:weather_app/ui/widgets/sub_weather_info_widget.dart';

import '../../widgets/custum_today_card.dart';
import 'cubits/current_weather/current_weather_states.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'HomeScreen';

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var viewModel = getIt.get<CurrentWeatherViewModel>();
  var locationVeiwModel = getIt.get<WeatherLocationViewModel>();

  @override
  void initState() {
    super.initState();
    viewModel.getCurrentWeather("cairo", "5");
    locationVeiwModel.getWeatherLocation("cairo", "5");
  }

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
                        BlocBuilder<WeatherLocationViewModel,
                            WeatherLoacationStates>(
                          bloc: locationVeiwModel,
                          builder: (context, state) {
                            if (state is LocationErrorState) {
                              return Padding(
                                padding: const EdgeInsets.all(16),
                                child: Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(state.message ?? 'Error'),
                                      const SizedBox(height: 20),
                                      ElevatedButton(
                                        onPressed: () {
                                          print(state.message);
                                        },
                                        style: const ButtonStyle(
                                          backgroundColor:
                                              MaterialStatePropertyAll<Color>(
                                                  Colors.black),
                                        ),
                                        child: const Text("Try again"),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            } else if (state is LocationSuccessState) {
                              return Text(
                                state.location!.name!,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                ),
                              );
                            } else {
                              return const Center(
                                child: Column(
                                  children: [
                                    CircularProgressIndicator(
                                      color: Colors.white,
                                    ),
                                  ],
                                ),
                              );
                            }
                          },
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
                BlocBuilder<CurrentWeatherViewModel, CurrentWeatherStates>(
                  bloc: viewModel,
                  builder: (context, state) {
                    if (state is LoadingState) {
                      return const Center(
                        child: Column(
                          children: [
                            CircularProgressIndicator(
                              color: Colors.white,
                            ),
                          ],
                        ),
                      );
                    } else if (state is ErrorState) {
                      return Padding(
                        padding: const EdgeInsets.all(16),
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(state.message ?? 'Error'),
                              const SizedBox(height: 20),
                              ElevatedButton(
                                onPressed: () {
                                  print(state.message);
                                },
                                style: const ButtonStyle(
                                  backgroundColor:
                                      MaterialStatePropertyAll<Color>(
                                          Colors.black),
                                ),
                                child: const Text("Try again"),
                              ),
                            ],
                          ),
                        ),
                      );
                    } else if (state is SuccessState) {
                      return DegreeInfo(
                        mainDgree: state.current!.tempC.toString(),
                        maxDgree: "34",
                        minDgree: "28",
                      );
                    } else {
                      return const Text(
                        "Fail",
                        style: TextStyle(color: Colors.black, fontSize: 64),
                      );
                    }
                  },
                ),
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
            )),
      ),
    );
  }
}


// BlocBuilder<CurrentWeatherViewModel, CurrentWeatherStates>(
//             bloc: viewModel,
//             builder: (context, state) {
//               if (state is LoadingState) {
//                 return const Center(
//                   child: Column(
//                     children: [
//                       CircularProgressIndicator(
//                         color: Colors.white,
//                       ),
//                     ],
//                   ),
//                 );
//               } else if (state is ErrorState) {
//                 return Padding(
//                   padding: const EdgeInsets.all(16),
//                   child: Center(
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Text(state.message ?? 'Error'),
//                         const SizedBox(height: 20),
//                         ElevatedButton(
//                           onPressed: () {
//                             print(state.message);
//                           },
//                           style: const ButtonStyle(
//                             backgroundColor:
//                                 MaterialStatePropertyAll<Color>(Colors.black),
//                           ),
//                           child: const Text("Try again"),
//                         ),
//                       ],
//                     ),
//                   ),
//                 );
//               } else if (state is SuccessState) {
//                 return Column(
//                   children: [
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Row(
//                           children: [
//                             const Icon(
//                               Icons.location_on_outlined,
//                               color: Colors.white,
//                             ),
//                             SizedBox(width: width * 0.02),
//                             const Text(
//                               "Cairo",
//                               style: TextStyle(
//                                 color: Colors.white,
//                                 fontSize: 18,
//                               ),
//                             ),
//                             SizedBox(width: width * 0.01),
//                             const Icon(
//                               Icons.arrow_drop_down,
//                               color: Colors.white,
//                             ),
//                           ],
//                         ),
//                         IconButton(
//                           onPressed: () {},
//                           icon: const Icon(
//                             Icons.settings,
//                             color: Colors.white,
//                           ),
//                         ),
//                       ],
//                     ),
//                     Container(
//                       height: height * 0.3,
//                       width: width * 0.5,
//                       decoration: const BoxDecoration(
//                         image: DecorationImage(
//                           image: AssetImage(ImagesURL.splashScreen),
//                           fit: BoxFit.cover,
//                         ),
//                       ),
//                     ),
//                     DegreeInfo(
//                         mainDgree: state.current!.tempC.toString(),
//                         maxDgree: "34",
//                         minDgree: "28"),
//                     SizedBox(height: height * 0.04),
//                     Container(
//                       width: double.infinity,
//                       height: height * 0.08,
//                       decoration: BoxDecoration(
//                         color: AppColors.lightOpacityColor.withOpacity(0.3),
//                         borderRadius: BorderRadius.circular(30),
//                       ),
//                       child: const SubWeatherInfoWidget(
//                         rainText: "18",
//                         tempText: "67",
//                         windText: "25",
//                       ),
//                     ),
//                     SizedBox(height: height * 0.04),
//                     Container(
//                       width: double.infinity,
//                       padding: const EdgeInsets.all(16),
//                       decoration: BoxDecoration(
//                         color: AppColors.lightOpacityColor.withOpacity(0.3),
//                         borderRadius: BorderRadius.circular(30),
//                       ),
//                       child: const CustomTodayCard(
//                         dateOfToday: "Mar, 16",
//                         degreeText1: "31 ْ",
//                         timeText1: "15.00",
//                         degreeText2: "30 ْ",
//                         timeText2: "16.00",
//                         degreeText3: "28 ْ",
//                         timeText3: "17.00",
//                         degreeText4: "29 ْ",
//                         timeText4: "18.00",
//                       ),
//                     ),
//                   ],
//                 );
//               } else {
//                 return const Text(
//                   "Fail",
//                   style: TextStyle(color: Colors.black, fontSize: 64),
//                 );
//               }
//             },
//           ),