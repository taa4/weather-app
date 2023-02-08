import 'package:flutter/material.dart' show Colors, MaterialColor;

class WeatherModel {
  DateTime date;
  double temp;
  double maxTemp;
  double minTemp;
  String weatherStationName;

  WeatherModel({
    required this.date,
    required this.temp,
    required this.maxTemp,
    required this.minTemp,
    required this.weatherStationName,
  });
  factory WeatherModel.fromJason(dynamic data) {
    var jasonData = data['forecast']['forecastday'][0]['day'];

    return WeatherModel(
      date: DateTime.parse(data['location']['localtime']),
      temp: jasonData['avgtemp_c'],
      maxTemp: jasonData['maxtemp_c'],
      minTemp: jasonData['mintemp_c'],
      weatherStationName: jasonData['condition']['text'],
    );
  }

  @override
  String toString() {
    return '''temp: $temp ,
     maxTemp: $maxTemp ,
      minTemp: $minTemp ,
       date: $date ,
        station: $weatherStationName''';
  }

  String getImage() {
    if (weatherStationName == 'Clear' ||
        weatherStationName == 'Light Cloud' ||
        weatherStationName == 'Sunny') {
      return 'assets/images/clear.png';
    } else if (weatherStationName == 'Snow' || weatherStationName == 'Hail') {
      return 'assets/images/snow.png';
    } else if (weatherStationName == 'Heavy Cloud') {
      return 'assets/images/cloudy.png';
    } else if (weatherStationName == 'Light rain' ||
        weatherStationName == 'Heavy rain' ||
        weatherStationName == 'Showers' ||
        weatherStationName == 'Moderate rain') {
      return 'assets/images/rainy.png';
    } else if (weatherStationName == 'Thunderstorm') {
      return 'assets/images/thunderstorm.png';
    } else {
      return 'assets/images/clear.png';
    }
  }

  MaterialColor getThemeColor() {
    if (weatherStationName == 'Clear' ||
        weatherStationName == 'Light Cloud' ||
        weatherStationName == 'Sunny') {
      return Colors.orange;
    } else if (weatherStationName == 'Snow' || weatherStationName == 'Hail') {
      return Colors.blue;
    } else if (weatherStationName == 'Heavy Cloud') {
      return Colors.blueGrey;
    } else if (weatherStationName == 'Light rain' ||
        weatherStationName == 'Heavy rain' ||
        weatherStationName == 'Showers' ||
        weatherStationName == 'Moderate rain') {
      return Colors.blue;
    } else if (weatherStationName == 'Thunderstorm') {
      return Colors.blueGrey;
    } else {
      return Colors.cyan;
    }
  }
}
