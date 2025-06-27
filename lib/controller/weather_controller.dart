import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../model/weather_model.dart';

class WeatherController extends GetxController {
  var weather = Rxn<Weather>();
  var isLoading = false.obs;
  var error = ''.obs;

  Future<void> fetchWeather(String city) async {
    isLoading.value = true;
    error.value = '';
    try {
      final apiKey =
          'API_KEY'
      final url =
          'https://api.openweathermap.org/data/2.5/weather?q=$city&appid=$apiKey&units=metric';
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        weather.value = Weather.fromJson(data);
      } else {
        error.value = "City not found.";
      }
    } catch (e) {
      error.value = "Failed to fetch weather.";
    } finally {
      isLoading.value = false;
    }
  }
}
