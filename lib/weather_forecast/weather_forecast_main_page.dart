import 'package:flutter/material.dart';
import 'package:flutter_app/location/model/location_model.dart';
import 'package:flutter_app/weather/model/weather_model.dart';
import 'package:flutter_app/weather_forecast/weather_forecast_list_tile.dart';
import 'package:flutter_app/weather_today/bloc/weather_today_bloc.dart';
import 'package:flutter_app/weather_today/bloc/weather_today_event.dart';
import 'package:flutter_app/weather_today/bloc/weather_today_state.dart';
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
    if (weatherTodayState is InitialWeatherTodayState) {
      BlocProvider.of<WeatherTodayBloc>(context).add(
        FetchWeatherTodayEvent(locationId: locations[0].woeid),
      );
    }

    if (weatherTodayState is WeatherTodayLoading) {
      return LoadingWeatherTodayBody();
    }

    if (weatherTodayState is LoadedWeatherTodayState) {
      return LoadedBodyWeatherToday(
        weather: weatherTodayState.weather,
      );
    }

    return LoadingWeatherTodayBody();
  }

  selectAppBarFromState(context, weatherTodayState) {
    if (weatherTodayState is LoadedWeatherTodayState) {
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
