import 'package:flutter/material.dart';
import 'package:flutter_app/weather/model/weather_model.dart';

class WeatherForecastListTile extends ListTile {
  final Weather weather;

  WeatherForecastListTile(
    this.weather,
  ) : super(
          title: content(),
        );

  static content() {
    return Text('asmdmsadoimsamoidmoiasdmoi');
  }
}
