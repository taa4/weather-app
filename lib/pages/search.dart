import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather/models/weather_model.dart';
import 'package:weather/providers/weather_provider.dart';

import 'package:weather/services/weather_service.dart';

class SearchPage extends StatelessWidget {
  String? cityName;

  SearchPage({this.updateUi});
  VoidCallback? updateUi;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('search ')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: TextField(
            onChanged: (data) => cityName = data,
            onSubmitted: (data) async {
              cityName = data;
              WeatherServices service = WeatherServices();

              WeatherModel? weather =
                  await service.getWeather(cityName: cityName!);
              Provider.of<WeatherProvider>(context, listen: false).weatherData =
                  weather;
              Provider.of<WeatherProvider>(context, listen: false).cityName =
                  cityName;
              print(weather);
              Navigator.pop(context);
            },
            decoration: InputDecoration(
              label: Text('Search'),
              contentPadding:
                  EdgeInsets.symmetric(vertical: 35, horizontal: 20),
              suffixIcon: GestureDetector(
                  onTap: () async {
                    WeatherServices service = WeatherServices();

                    WeatherModel? weather =
                        await service.getWeather(cityName: cityName!);
                    Provider.of<WeatherProvider>(context, listen: false)
                        .weatherData = weather;
                    Provider.of<WeatherProvider>(context, listen: false)
                        .cityName = cityName;
                    print(weather);
                    Navigator.pop(context);
                  },
                  child: Icon(Icons.search)),
              hintText: 'Input City',
              border: OutlineInputBorder(),
            ),
          ),
        ),
      ),
    );
  }
}
