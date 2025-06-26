import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sample_flutter_weather_app/pages/splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Weather App',
      home: SplashScreen(),
    );
  }
}
