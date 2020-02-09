import 'package:flutter/material.dart';
import 'package:flutter_app/weather/model/weather_model.dart';
import 'package:flutter_app/weather/weather_icons.dart';

class WeatherForecastListTile extends ListTile {
  final Weather weather;

  WeatherForecastListTile(
    this.weather,
  )   : assert(weather != null),
        super(
          title: _content(weather),
        );

  static _content(Weather weather) {
    final row = Row(
      children: <Widget>[
        _weatherIcon(weather.condition),
        _temp(weather.temp),
      ],
    );

    return Column(
      children: <Widget>[
        row,
      ],
    );
  }

  static _date(){

  }

  static _weatherIcon(condition) {
    return Icon(
      WeatherIcons.fromCondition(condition),
      size: 50,
      color: Colors.white,
    );
  }

  static _temp(temp) {
    return Text(
      temp.toInt().toString(),
      style: TextStyle(fontSize: 50),
    );
  }
}
