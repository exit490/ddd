import 'package:flutter/material.dart';
import 'package:flutter_app/weather/model/weather_model.dart';
import 'package:flutter_app/weather/weather_icons.dart';
import 'package:intl/intl.dart';

class WeatherForecastBox extends StatelessWidget {
  final Weather weather;
  static final _fontSize = 22.0;
  static final _c = '°';

  WeatherForecastBox(
    this.weather,
  ) : assert(weather != null);

  @override
  Widget build(BuildContext context) {
    return _content(weather);
  }

  _content(Weather weather) {
    final leftPadding = Padding(
      padding: EdgeInsets.only(left: 10),
    );

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        _boxRow1(weather),
        leftPadding,
        leftPadding,
        _temp(weather.temp),
        leftPadding,
        _boxRow2(weather),
      ],
    );
  }

  _boxRow1(weather) {
    return Row(
      children: <Widget>[
        _dateAndWeatherIcon(weather),
      ],
    );
  }

  _boxRow2(weather) {
    return Row(
      children: <Widget>[
        _minMaxAndWeatherText(weather),
      ],
    );
  }

  _dateAndWeatherIcon(Weather weather) {
    return Column(
      children: <Widget>[
        _date(weather.applicableDate),
        _weatherIcon(weather.condition),
      ],
    );
  }

  _minMaxAndWeatherText(Weather weather) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        _weatherText(weather.formattedCondition),
        _minMaxTemps(weather),
      ],
    );
  }

  _date(String applicableDate) {
    return Text(
      _formatDate(applicableDate),
      style: TextStyle(fontSize: 25),
    );
  }

  _minMaxTemps(Weather weather) {
    final leftPadding = Padding(
      padding: EdgeInsets.only(left: 5),
    );
    return Row(
      children: <Widget>[
        _maxTemp(weather.maxTemp),
        leftPadding,
        _minTemp(weather.minTemp),
      ],
    );
  }

  _weatherText(formattedCondition) {
    return Text(
      formattedCondition,
      style: TextStyle(fontSize: 25),
    );
  }

  _weatherIcon(condition) {
    return Icon(
      WeatherIcons.fromCondition(condition),
      size: 50,
      color: Colors.white,
    );
  }

  _temp(temp) {
    return Text(
      temp.toInt().toString() + _c,
      style: TextStyle(fontSize: 70),
    );
  }

  _minTemp(minTemp) {
    final downIcon = Icon(
      Icons.arrow_downward,
      size: _fontSize,
      color: Colors.white,
    );

    final minTempText = Text(
      minTemp.toInt().toString() + _c,
      style: TextStyle(fontSize: _fontSize),
    );

    return Row(
      children: <Widget>[
        downIcon,
        minTempText,
      ],
    );
  }

  _maxTemp(maxTemp) {
    final upIcon = Icon(
      Icons.arrow_upward,
      size: _fontSize,
      color: Colors.white,
    );

    final maxTempText = Text(
      maxTemp.toInt().toString() + _c,
      style: TextStyle(fontSize: _fontSize),
    );

    return Row(
      children: <Widget>[
        upIcon,
        maxTempText,
      ],
    );
  }

  _formatDate(applicableDate) {
    final dateSlitted = applicableDate.split('-');
    final year = int.parse(dateSlitted[0]);
    final month = int.parse(dateSlitted[1]);
    final day = int.parse(dateSlitted[2]);

    final date = DateTime(year, month, day);
    return DateFormat.E().format(date);
  }
}
