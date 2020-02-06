import 'package:flutter/material.dart';
import 'package:flutter_app/weather_today/view/weather_today_page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final newTextTheme = Theme.of(context).textTheme.apply(
          bodyColor: Colors.white,
          displayColor: Colors.white,
        );

    final theme = ThemeData(
      textTheme: newTextTheme,
      canvasColor: Colors.black26,
    );

    return MaterialApp(
      theme: theme,
      home: WeatherTodayPage(),
    );
  }
}
