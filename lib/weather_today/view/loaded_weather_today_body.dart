import 'package:flutter/material.dart';
import 'package:flutter_app/weather/model/weather_model.dart';
import 'package:flutter_app/weather_today/view/widget/min_max_temp_row.dart';
import 'package:flutter_app/weather_today/view/widget/temp_text_row.dart';
import 'package:flutter_app/weather_today/view/widget/weather_icons_and_text_row_view.dart';

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

    final paddind = Padding(
      padding: EdgeInsets.only(bottom: 5),
    );

    final column = Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        weatherIconAndTextRow,
        paddind,
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
