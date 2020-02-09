import 'package:flutter/material.dart';
import 'package:flutter_app/weather/model/weather_model.dart';

import '../../../weather/weather_icons.dart';

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
      WeatherIcons.fromCondition(condition),
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
}
