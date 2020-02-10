import 'package:flutter/material.dart';
import 'package:flutter_app/weather/model/weather_model.dart';
import 'package:flutter_app/weather/view/weather_backgroud.dart';
import 'package:flutter_app/weather_forecast/bloc/weather_forecast_bloc.dart';
import 'package:flutter_app/weather_forecast/bloc/weather_forecast_state.dart';
import 'package:flutter_app/weather_forecast/widget/weather_forecast_list_tile.dart';
import 'package:flutter_app/weather_today/view/loading_weather_today_body.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WeatherForecastMainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherForecastBloc, WeatherForecastState>(
      builder: (context, state) {
        return _selectBodyFromState(context, state);
      },
    );
  }

  _selectBodyFromState(context, weatherTodayState) {
    if (weatherTodayState is LoadingWeatherForecastState) {
      return LoadingWeatherTodayBody();
    }

    if (weatherTodayState is LoadedWeatherForecastState) {
      return _stack(context, weatherTodayState.weatherForecast);
    }

    return LoadingWeatherTodayBody();
  }

  _stack(context, List<Weather> weatherForecast) {
    return Stack(children: [
      WeatherBackground(
        condition: weatherForecast[0].condition,
      ),
      _scaffold(weatherForecast),
    ]);
  }

  _scaffold(weatherForecast) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: _weatherForecastList(weatherForecast),
    );
  }

  _weatherForecastList(List<Weather> weatherForecast) {
    final listTile =
        weatherForecast.map((weather) => WeatherForecastBox(weather)).toList();

    final column = Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: listTile,
    );

    return Center(
      child: column,
    );
  }
}
