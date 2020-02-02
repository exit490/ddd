import 'package:flutter/material.dart';

import '../../weather/weather_icons.dart';

weatherIconAndTextRow() {
  var weatherIcon = Icon(
    WeatherIcons.rain,
    size: 35,
    color: Colors.white,
  );

  var weatherText = Text(
    'Cloudy',
    style: TextStyle(fontSize: 20),
  );

  var padding = Padding(
    padding: EdgeInsets.only(left: 8),
  );

  return Row(
    children: <Widget>[
      weatherIcon,
      padding,
      weatherText,
    ],
  );
}
