import 'package:flutter/material.dart';
import 'package:flutter_app/weather/model/model_weather.dart';
import 'package:flutter_app/weather_today/view/widget/row_min_max_temp.dart';
import 'package:flutter_app/weather_today/view/widget/row_temp_text.dart';
import 'package:flutter_app/weather_today/view/widget/row_weather_icons_and_text.dart';

class LoadedBodyWeatherToday extends StatelessWidget {
  final Weather weather;

  LoadedBodyWeatherToday({
    Key key,
    @required this.weather,
  })  : assert(weather != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final weatherIconAndTextRow = WeatherIconAndTextRow(
      formattedCondition: weather.formattedCondition,
      condition: weather.condition,
    );

    final minMaxTempRow = MinMaxTempRow(
      minTemp: weather.minTemp,
      maxTemp: weather.maxTemp,
    );

    final tempText = TempText(
      temp: weather.temp,
    );

    final column = Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        weatherIconAndTextRow,
        minMaxTempRow,
        tempText,
      ],
    );

    return Padding(
      padding: EdgeInsets.only(left: 15),
      child: column,
    );
  }
}
