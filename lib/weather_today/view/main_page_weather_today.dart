import 'package:flutter/material.dart';
import 'package:flutter_app/weather_today/bloc/bloc_weather_today.dart';
import 'package:flutter_app/weather_today/bloc/event_weather_today.dart';
import 'package:flutter_app/weather_today/bloc/state_weather_today.dart';
import 'package:flutter_app/weather_today/view/loaded_body_weather_today.dart';
import 'package:flutter_app/weather_today/view/loading_body_weather_today.dart';
import 'package:flutter_app/weather_today/view/widget/location_app_bar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WeatherTodayPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<BlocWeatherToday>(context).add(
      FetchWeatherTodayEvent(locationId: 455825),
    );

    final blocBuilder = BlocBuilder<BlocWeatherToday, StateWeatherToday>(
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
        weatherBackground(context),
        body(weatherTodayState),
      ],
    );
  }

  body(weatherTodayState) {
    return Scaffold(
      appBar: selectAppBarFromState(weatherTodayState),
      backgroundColor: Colors.transparent,
      drawer: buildNavigationDrawer(),
      body: selectBodyFromState(weatherTodayState),
    );
  }

  selectBodyFromState(weatherTodayState) {
    if (weatherTodayState is WeatherTodayLoading) {
      return LoadingBodyWeatherToday();
    }

    if (weatherTodayState is LoadedStateWeatherToday) {
      return LoadedBodyWeatherToday(
        weather: weatherTodayState.weather,
      );
    }

    return LoadingBodyWeatherToday();
  }

  selectAppBarFromState(weatherTodayState) {
    if (weatherTodayState is LoadedStateWeatherToday) {
      return LocationAppBar(
        locationName: weatherTodayState.weather.location,
        hasAddButton: true,
      );
    }

    return LocationAppBar(
      locationName: '',
      hasAddButton: false,
    );
  }
}

weatherBackground(context) {
  return Image.asset(
    "assets/images/cloudy_1.jpg",
    height: MediaQuery.of(context).size.height,
    width: MediaQuery.of(context).size.width,
    fit: BoxFit.cover,
  );
}

buildNavigationDrawer() {
  var listTile1 = ListTile(
    title: Text('São pedro da Aldeia'),
  );

  var listTile2 = ListTile(
    title: Text('São pedro da Aldeia'),
  );

  var listView = ListView(
    children: <Widget>[
      listTile1,
      listTile2,
    ],
  );

  return Drawer(
    child: listView,
  );
}
