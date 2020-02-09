import 'package:flutter/material.dart';
import 'package:flutter_app/weather/model/weather_model.dart';
import 'package:flutter_app/weather/weather_icons.dart';

class WeatherForecastListTile extends ListTile {
  final Weather weather;

  WeatherForecastListTile(
    this.weather,
  )   : assert(weather != null),
        super(
          title: content(weather),
        );

  static content(weather) {
    return Row(
      children: <Widget>[
        weatherIcon(weather.condition),
      ],
    );
  }

  static weatherIcon(condition) {
    return Icon(
      WeatherIcons.fromCondition(condition),
      size: 50,
      color: Colors.white,
    );
  }
}
