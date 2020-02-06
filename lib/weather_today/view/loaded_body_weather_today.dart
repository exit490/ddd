import 'package:flutter/material.dart';
import 'package:flutter_app/weather_today/bloc/weather_today_state.dart';

class LoadedBodyWeatherToday extends StatelessWidget {
  final LoadedStateWeatherToday loadedStateWeatherToday;

  LoadedBodyWeatherToday({
    Key key,
    @required this.loadedStateWeatherToday,
  })  : assert(loadedStateWeatherToday != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return body();
  }

  body() {
    var column = Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        // weatherIconAndTextRow(),
        // minMaxDegreeRow(),
        // degreeText(),
      ],
    );

    return Padding(
      padding: EdgeInsets.only(left: 15),
      child: column,
    );
  }
}
