import 'package:flutter/material.dart';
import 'package:flutter_app/location/model/location_model.dart';
import 'package:flutter_app/weather/model/weather_model.dart';
import 'package:flutter_app/weather_forecast/bloc/weather_forecast_state.dart';
import 'package:flutter_app/weather_forecast/widget/weather_forecast_list_tile.dart';
import 'package:flutter_app/weather_today/view/loading_weather_today_body.dart';

class WeatherForecastMainPage extends StatelessWidget {
  final List<LocationModel> locations;

  WeatherForecastMainPage({
    this.locations,
  }) : assert(locations != null);

  @override
  Widget build(BuildContext context) {
    return main(context);
  }

  main(context) {
    return Stack(
      children: <Widget>[
        weatherBackground(context),
        body(context),
      ],
    );
  }

  body(context) {
    final weather = Weather(
      condition: WeatherCondition.hail,
      temp: 21.2,
      applicableDate: '2020-05-20',
      formattedCondition: 'Heavy rain',
      maxTemp: 39,
      minTemp: 11.2,
    );

    final listView = ListView(
      physics: NeverScrollableScrollPhysics(),
      children: <Widget>[
        WeatherForecastListTile(weather),
        WeatherForecastListTile(weather),
        WeatherForecastListTile(weather),
        WeatherForecastListTile(weather),
        WeatherForecastListTile(weather),
        WeatherForecastListTile(weather),
      ],
    );

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: listView,
    );
  }

  selectBodyFromState(context, weatherTodayState) {
    if (weatherTodayState is LoadingWeatherForecastState) {
      return LoadingWeatherTodayBody();
    }

    if (weatherTodayState is LoadedWeatherForecastState) {}

    return LoadingWeatherTodayBody();
  }
}

weatherBackground(context) {
  return Image.asset(
    "assets/images/shower_1.jpg",
    height: MediaQuery.of(context).size.height,
    width: MediaQuery.of(context).size.width,
    fit: BoxFit.cover,
  );
}
