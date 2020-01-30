import 'package:flutter/material.dart';
import 'package:flutter_app/weather_today_page.dart';

void main() => runApp(HomePage());

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: WeatherTodayPage(),
    );
  }
}
