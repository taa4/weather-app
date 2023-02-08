import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather/models/weather_model.dart';

class WeatherServices {
  String baseUrl = 'http://api.weatherapi.com/v1';
  String apiKey = '0335d8d5463c46cdba8144236230102';
  Future<WeatherModel?> getWeather({required String cityName}) async {
    WeatherModel? weatherData;

    try {
      //int id = getCityId(cityName: cityName);
      Uri url = Uri.parse(
        '$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=7',
      );

      http.Response response = await http.get(url);

      Map<String, dynamic> data = jsonDecode(response.body);

      weatherData = WeatherModel.fromJason(data);
    } catch (e) {
      print(e);
    }
    return weatherData;
  }
}
