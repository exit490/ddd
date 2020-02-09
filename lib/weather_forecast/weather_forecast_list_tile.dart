import 'package:flutter/material.dart';
import 'package:flutter_app/weather/model/weather_model.dart';
import 'package:flutter_app/weather/weather_icons.dart';

class WeatherForecastListTile extends ListTile {
  final Weather weather;
  static final _fontSize = 22.0;

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
        _maxTemp(weather.maxTemp),
        _minTemp(weather.minTemp),
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

  static _minTemp(minTemp) {
    final downIcon = Icon(
      Icons.arrow_downward,
      size: _fontSize,
      color: Colors.white,
    );

    final minTempText = Text(
      minTemp.toInt().toString(),
      style: TextStyle(fontSize: _fontSize),
    );

    return Row(
      children: <Widget>[
        downIcon,
        minTempText,
      ],
    );
  }

  static _maxTemp(maxTemp) {
    final upIcon = Icon(
      Icons.arrow_upward,
      size: _fontSize,
      color: Colors.white,
    );

    final maxTempText = Text(
      maxTemp.toInt().toString(),
      style: TextStyle(fontSize: _fontSize),
    );

    return Row(
      children: <Widget>[
        upIcon,
        maxTempText,
      ],
    );
  }
}
