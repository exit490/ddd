import 'package:flutter/material.dart';
import 'package:flutter_app/weather_today/weather_today_page.dart';

void main() => runApp(HomePage());

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final newTextTheme = Theme.of(context).textTheme.apply(
          bodyColor: Colors.white,
          displayColor: Colors.white,
        );

    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: newTextTheme,
      ),
      home: WeatherTodayPage(),
    );
  }
}
