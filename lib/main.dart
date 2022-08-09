import 'package:flutter/material.dart';
import 'package:weather_application/repo.dart';
import 'package:weather_application/weather_model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController controller = TextEditingController();
  WeatherModel? weatherModel;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: Text("weather app"),
            ),
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  controller: controller,
                ),
                ElevatedButton(
                    onPressed: () async {
                      weatherModel = await Repo().getWeather(controller.text);
                      print(weatherModel?.main?.temp ?? "error");
                      setState(() {});
                    },
                    child: Text("search")),
                Text("temp ${weatherModel?.main?.temp}"),
                Text("min temp${weatherModel?.main?.tempMin}"),
                Text("max temp${weatherModel?.main?.tempMax}"),
              ],
            )));
  }
}
