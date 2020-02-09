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
    return Column(
      children: <Widget>[
        _dateAndWeatherText(weather),
        _tempAndWeatherIcon(weather),
      ],
    );
  }

  static _tempAndWeatherIcon(Weather weather) {
    return Row(
      children: <Widget>[
        _weatherIcon(weather.condition),
        _temp(weather.temp),
      ],
    );
  }

  static _dateAndWeatherText(Weather weather) {
    return Row(
      children: <Widget>[
        _date(weather.applicableDate),
        _weatherText(weather.formattedCondition),
      ],
    );
  }

  static _date(applicableDate) {
    return Text(
      applicableDate,
      style: TextStyle(fontSize: 25),
    );
  }

  static _weatherText(formattedCondition) {
    return Text(
      formattedCondition,
      style: TextStyle(fontSize: 25),
    );
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
