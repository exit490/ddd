import 'package:flutter/material.dart';
import 'package:flutter_app/weather/model/weather_model.dart';

import '../../weather/weather_icons.dart';

class WeatherIconAndTextRow extends StatelessWidget {
  final String formattedCondition;
  final WeatherCondition condition;

  WeatherIconAndTextRow({
    @required this.formattedCondition,
    @required this.condition,
  }) : assert(formattedCondition != null, condition != null);

  final padding = Padding(
    padding: EdgeInsets.only(left: 8),
  );

  weatherText() {
    return Text(
      formattedCondition,
      style: TextStyle(fontSize: 20),
    );
  }

  weatherIcon() {
    return Icon(
      iconDataFromCondition(),
      size: 35,
      color: Colors.white,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        weatherIcon(),
        padding,
        weatherText(),
      ],
    );
  }

  IconData iconDataFromCondition() {
    switch (condition) {
      case WeatherCondition.snow:
        return WeatherIcons.snow;
        break;
      case WeatherCondition.sleet:
        return WeatherIcons.snow_alt;
        break;
      case WeatherCondition.hail:
        return WeatherIcons.hail;
        break;
      case WeatherCondition.thunderstorm:
        return WeatherIcons.clouds_flash_alt;
        break;
      case WeatherCondition.heavyRain:
        return WeatherIcons.windy_rain;
        break;
      case WeatherCondition.lightRain:
        return WeatherIcons.rain;
        break;
      case WeatherCondition.showers:
        return WeatherIcons.rain;
        break;
      case WeatherCondition.heavyCloud:
        return WeatherIcons.clouds;
        break;
      case WeatherCondition.lightCloud:
        return WeatherIcons.fog_cloud;
        break;
      case WeatherCondition.clear:
        return WeatherIcons.sun;
        break;
      default:
        return WeatherIcons.na;
    }
  }
}
