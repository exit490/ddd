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
    return StreamBuilder(builder: (context, snapshot) {
      return _content(weather);
    });
  }

  _content(Weather weather) {
    final body = Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Expanded(
          flex: 1,
          child: _dateAndWeatherIcon(weather),
        ),
        Expanded(
          flex: 1,
          child: _temp(weather.temp),
        ),
        Expanded(
          flex: 2,
          child: _minMaxAndWeatherText(weather),
        )
      ],
    );

    final padding = Padding(
      padding: EdgeInsets.only(top: 15),
    );

    return Column(
      children: <Widget>[padding, body],
    );
  }

  _dateAndWeatherIcon(Weather weather) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
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

  _weatherText(formattedCondition) {
    return Text(
      formattedCondition,
      style: TextStyle(fontSize: 22),
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
    final text = Text(
      temp.toInt().toString() + _c,
      style: TextStyle(fontSize: 50),
    );

    return Center(
      child: text,
    );
  }

  _minMaxTemps(weather) {
    final upIcon = Icon(
      Icons.arrow_upward,
      size: _fontSize,
      color: Colors.white,
    );

    final maxTempText = Text(
      weather.maxTemp.toInt().toString() + _c,
      style: TextStyle(fontSize: _fontSize),
    );

    final downIcon = Icon(
      Icons.arrow_downward,
      size: _fontSize,
      color: Colors.white,
    );

    final minTempText = Text(
      weather.minTemp.toInt().toString() + _c,
      style: TextStyle(fontSize: _fontSize),
    );

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        upIcon,
        maxTempText,
        downIcon,
        minTempText,
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
