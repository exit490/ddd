import 'package:flutter/material.dart';
import 'package:flutter_app/weather_today/bloc/weather_today_state.dart';

class LoadedBodyWeatherToday extends StatelessWidget {
  LoadedBodyWeatherToday({
    Key key,
    LoadedStateWeatherToday loadedStateWeatherToday,
  })  : assert(loadedStateWeatherToday != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        backgroundColor: Colors.white,
      ),
    );
  }
}
