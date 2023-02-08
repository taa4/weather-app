import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather/models/weather_model.dart';
import 'package:weather/pages/search.dart';
import 'package:weather/providers/weather_provider.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void updateUi() {
    setState(() {});
  }

  WeatherModel? weatherData;

  TextStyle x = TextStyle(fontSize: 30, color: Colors.black);

  @override
  Widget build(BuildContext context) {
    weatherData =
        Provider.of<WeatherProvider>(context, listen: true).weatherData;
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return SearchPage(
                      updateUi: updateUi,
                    );
                  }));
                },
                icon: Icon(Icons.search))
          ],
          title: Text('Weather App'),
        ),
        body: weatherData == null
            ? Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'there is no weather 😔 start',
                      style: TextStyle(
                        fontSize: 30,
                      ),
                    ),
                    Text(
                      'searching now 🔍',
                      style: TextStyle(
                        fontSize: 30,
                      ),
                    )
                  ],
                ),
              )
            : Center(
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        weatherData!.getThemeColor(),
                        weatherData!.getThemeColor()[300]!,
                        weatherData!.getThemeColor()[100]!,
                        weatherData!.getThemeColor()[50]!
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Spacer(flex: 3),
                      Text(
                        Provider.of<WeatherProvider>(context).cityName ??
                            'None',
                        style: x,
                      ),
                      Text(
                          'Updates: ${weatherData!.date.hour}: ${weatherData!.date.minute}'),
                      const Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Image.asset(weatherData!.getImage()),
                          Text(
                            '${weatherData!.temp}',
                            style: x,
                          ),
                          Column(
                            children: [
                              Text('max: ${weatherData!.maxTemp}'),
                              Text('min: ${weatherData!.minTemp}')
                            ],
                          )
                        ],
                      ),
                      const Spacer(),
                      Text('${weatherData!.weatherStationName}', style: x),
                      const Spacer(flex: 5),
                    ],
                  ),
                ),
              ));
  }
}
