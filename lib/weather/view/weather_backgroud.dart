import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/weather/model/weather_model.dart';
import 'package:flutter_app/weather_forecast/bloc/weather_forecast_bloc.dart';
import 'package:flutter_app/weather_forecast/bloc/weather_forecast_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WeatherBackground extends StatelessWidget {
  final _assetsPath = 'assets/images/';
  final _jpg = '.jpg';
  final _totalImages = 1;

  const WeatherBackground();

  @override
  Widget build(BuildContext context) {
    final blocBuilder = BlocBuilder<WeatherForecastBloc, WeatherForecastState>(
      builder: (context, weatherTodayState) {
        return _selectBackgroundFromState(context, weatherTodayState);
      },
    );

    final streamBuilder = StreamBuilder(
      builder: (context, snapshot) {
        return blocBuilder;
      },
    );

    return Stack(
      children: <Widget>[
        streamBuilder,
        Container(
          color: Colors.black26,
        )
      ],
    );
  }

  _selectBackgroundFromState(context, weatherTodayState) {
    if (weatherTodayState is LoadedWeatherForecastState) {
      return _backGroundImage(
        context,
        weatherTodayState.weatherForecast[0].condition,
      );
    }

    return _backGroundImage(context, WeatherCondition.unknown);
  }

  _backGroundImage(context, condition) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Image.asset(
      _imagePath(condition),
      height: height,
      width: width,
      fit: BoxFit.cover,
    );
  }

  String _imagePath(condition) {
    if (condition == WeatherCondition.unknown) {
      return _assetsPath + 'sun_time_lapse.gif';
    }

    return _assetsPath + _getStringConditional(condition) + '/' + _randomJpg();
  }

  String _getStringConditional(condition) {
    return condition.toString().replaceAll('WeatherCondition.', '');
  }

  String _randomJpg() {
    final randomNumber = Random().nextInt(_totalImages);
    return randomNumber.toString() + _jpg;
  }
}
