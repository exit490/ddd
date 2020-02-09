import 'package:flutter/material.dart';
import 'package:flutter_app/location/model/location_model.dart';
import 'package:flutter_app/weather/model/weather_model.dart';
import 'package:flutter_app/weather_forecast/bloc/weather_forecast_bloc.dart';
import 'package:flutter_app/weather_forecast/bloc/weather_forecast_event.dart';
import 'package:flutter_app/weather_forecast/bloc/weather_forecast_state.dart';
import 'package:flutter_app/weather_forecast/weather_forecast_list_tile.dart';
import 'package:flutter_app/weather_today/view/loaded_weather_today_body.dart';
import 'package:flutter_app/weather_today/view/loading_weather_today_body.dart';
import 'package:flutter_app/weather_today/view/widget/location_app_bar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
    if (weatherTodayState is InitialWeatherForecastState) {
      BlocProvider.of<WeatherForecastBloc>(context).add(
        FetchWeatherForecastEvent(locationId: locations[0].woeid),
      );
    }

    if (weatherTodayState is LoadingWeatherForecastState) {
      return LoadingWeatherTodayBody();
    }

    if (weatherTodayState is LoadedWeatherForecastState) {
      return LoadedBodyWeatherToday(
        weather: weatherTodayState.weather,
      );
    }

    return LoadingWeatherTodayBody();
  }

  selectAppBarFromState(context, weatherTodayState) {
    if (weatherTodayState is LoadedWeatherForecastState) {
      return LocationAppBar(
        locationName: weatherTodayState.weather.location,
        enableAddButton: true,
        context: context,
      );
    }

    return LocationAppBar(
      locationName: '',
      enableAddButton: false,
      context: context,
    );
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
