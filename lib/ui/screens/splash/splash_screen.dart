import 'package:flutter/material.dart';
import 'package:weather_app/ui/screens/home/home_screen.dart';
import 'package:weather_app/ui/utils/images_constants.dart';

class SplashScreen extends StatefulWidget {
  static const String routeName = 'SplashScreen';
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(
      const Duration(milliseconds: 1500),
      () => Navigator.pushReplacementNamed(context, HomeScreen.routeName),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Center(
        child: Container(
          height: height * 0.3,
          width: width * 0.5,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(ImagesURL.splashScreen),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
