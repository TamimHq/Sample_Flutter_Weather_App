import 'package:get/get.dart';
import 'dart:async';

import '../pages/weather_page.dart.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    _navigateToHome();
  }

  void _navigateToHome() {
    Timer(const Duration(seconds: 6), () {
      Get.off(() => WeatherPage());
    });
  }
}
