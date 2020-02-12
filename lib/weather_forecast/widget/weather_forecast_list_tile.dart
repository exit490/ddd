import 'package:flutter/material.dart';
import 'package:flutter_app/weather/model/weather_model.dart';
import 'package:flutter_app/weather/weather_icons.dart';
import 'package:intl/intl.dart';

class WeatherForecastBox extends StatefulWidget {
  final Weather weather;

  WeatherForecastBox(
    this.weather,
  ) : assert(weather != null);

  @override
  State<StatefulWidget> createState() {
    return _WeatherForecastBoxState();
  }
}

class _WeatherForecastBoxState extends State<WeatherForecastBox> {
  static final _fontSize = 22.0;
  static final _c = '°';
  Weather _weather;

  _WeatherForecastBoxState();

  _weatherState() {
    setState(() {
      _weather = widget.weather;
    });
  }

  @override
  Widget build(BuildContext context) {
    _weatherState();
    return _content();
  }

  _content() {
    final body = Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Expanded(
          flex: 1,
          child: _dateAndWeatherIcon(),
        ),
        Expanded(
          flex: 1,
          child: _temp(_weather.temp),
        ),
        Expanded(
          flex: 2,
          child: _minMaxAndWeatherText(),
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

  _dateAndWeatherIcon() {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        _date(),
        _weatherIcon(),
      ],
    );
  }

  _minMaxAndWeatherText() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        _weatherText(),
        _minMaxTemps(),
      ],
    );
  }

  _date() {
    return Text(
      _formatDate(_weather.applicableDate),
      style: TextStyle(fontSize: 25),
    );
  }

  _weatherText() {
    return Text(
      _weather.formattedCondition,
      style: TextStyle(fontSize: 22),
    );
  }

  _weatherIcon() {
    return Icon(
      WeatherIcons.fromCondition(_weather.condition),
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

  _minMaxTemps() {
    final upIcon = Icon(
      Icons.arrow_upward,
      size: _fontSize,
      color: Colors.white,
    );

    final maxTempText = Text(
      _weather.maxTemp.toInt().toString() + _c,
      style: TextStyle(fontSize: _fontSize),
    );

    final downIcon = Icon(
      Icons.arrow_downward,
      size: _fontSize,
      color: Colors.white,
    );

    final minTempText = Text(
      _weather.minTemp.toInt().toString() + _c,
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
