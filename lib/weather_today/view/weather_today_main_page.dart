import 'package:flutter/material.dart';
import 'package:flutter_app/location/model/location_model.dart';
import 'package:flutter_app/location/view/location_navigation_drawer.dart';
import 'package:flutter_app/weather/model/weather_model.dart';
import 'package:flutter_app/weather/view/weather_backgroud.dart';
import 'package:flutter_app/weather_forecast/bloc/weather_forecast_bloc.dart';
import 'package:flutter_app/weather_forecast/bloc/weather_forecast_event.dart';
import 'package:flutter_app/weather_forecast/bloc/weather_forecast_state.dart';
import 'package:flutter_app/weather_today/view/loaded_weather_today_body.dart';
import 'package:flutter_app/weather_today/view/loading_weather_today_body.dart';
import 'package:flutter_app/weather_today/view/widget/location_app_bar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WeatherTodayMainPage extends StatelessWidget {
  final List<LocationModel> locations;

  WeatherTodayMainPage({
    this.locations,
  }) : assert(locations != null);

  @override
  Widget build(BuildContext context) {
    final blocBuilder = BlocBuilder<WeatherForecastBloc, WeatherForecastState>(
      builder: (context, weatherTodayState) {
        return main(
          context,
          weatherTodayState,
        );
      },
    );

    return Container(
      child: blocBuilder,
    );
  }

  main(context, weatherTodayState) {
    return Stack(
      children: <Widget>[
        selectBackgroundFromState(weatherTodayState),
        body(context, weatherTodayState),
      ],
    );
  }

  body(context, weatherTodayState) {
    return Scaffold(
      appBar: selectAppBarFromState(context, weatherTodayState),
      backgroundColor: Colors.transparent,
      drawer: LocationsNavigationDrawer(locations),
      body: selectBodyFromState(context, weatherTodayState),
    );
  }

  selectBackgroundFromState(weatherTodayState) {
    if (weatherTodayState is InitialWeatherForecastState) {
      return WeatherBackground(
        condition: WeatherCondition.clear,
      );
    }

    if (weatherTodayState is LoadingWeatherForecastState) {
      return WeatherBackground(
        condition: WeatherCondition.clear,
      );
    }

    if (weatherTodayState is LoadedWeatherForecastState) {
      return WeatherBackground(
        condition: weatherTodayState.weatherForecast[0].condition,
      );
    }

    return WeatherBackground(
      condition: WeatherCondition.clear,
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
        weather: weatherTodayState.weatherForecast[0],
      );
    }

    return LoadingWeatherTodayBody();
  }

  selectAppBarFromState(context, weatherTodayState) {
    if (weatherTodayState is LoadedWeatherForecastState) {
      return LocationAppBar(
        locationName: weatherTodayState.weatherForecast[0].location,
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
