import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/weather/view/weather_backgroud.dart';

class HomeBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final textStyle = TextStyle(fontSize: 50);
    final titleApp = Text(
      'FLUTTER \nWEATHER \nAPP',
      style: textStyle,
    );

    final center = Center(
      child: titleApp,
    );

    final scaffold = Scaffold(
      body: center,
    );

    return Stack(
      children: <Widget>[
        WeatherBackground(),
        scaffold,
      ],
    );
  }
}
