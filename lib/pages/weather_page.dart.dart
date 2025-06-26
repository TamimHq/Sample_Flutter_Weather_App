import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/weather_controller.dart';

class WeatherPage extends StatelessWidget {
  final controller = Get.put(WeatherController());
  final cityController = TextEditingController();

  WeatherPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('🌦️ Weather App')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: cityController,
              decoration: InputDecoration(labelText: 'Enter City'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () => controller.fetchWeather(cityController.text),
              child: Text('Get Weather'),
            ),
            SizedBox(height: 20),
            Obx(() {
              if (controller.isLoading.value) {
                return CircularProgressIndicator();
              } else if (controller.error.value.isNotEmpty) {
                return Text(controller.error.value, style: TextStyle(color: Colors.red));
              } else if (controller.weather.value != null) {
                final w = controller.weather.value!;
                return Column(
                  children: [
                    Text(w.cityName, style: TextStyle(fontSize: 24)),
                    Text('${w.temperature}°C', style: TextStyle(fontSize: 36)),
                    Text(w.description, style: TextStyle(fontSize: 18)),
                  ],
                );
              } else {
                return Text('Enter a city to get weather info.');
              }
            }),
          ],
        ),
      ),
    );
  }
}
