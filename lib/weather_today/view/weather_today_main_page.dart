import 'package:flutter/material.dart';
import 'package:flutter_app/location/model/location_model.dart';
import 'package:flutter_app/weather_today/bloc/weather_today_bloc.dart';
import 'package:flutter_app/weather_today/bloc/weather_today_event.dart';
import 'package:flutter_app/weather_today/bloc/weather_today_state.dart';
import 'package:flutter_app/weather_today/view/loaded_weather_today_body.dart';
import 'package:flutter_app/weather_today/view/loading_weather_today_body.dart';
import 'package:flutter_app/weather_today/view/widget/location_app_bar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WeatherTodayMainPage extends StatelessWidget {
  final LocationModel defaultLocation;

  WeatherTodayMainPage({
    this.defaultLocation,
  }) : assert(defaultLocation != null);

  @override
  Widget build(BuildContext context) {
    final blocBuilder = BlocBuilder<WeatherTodayBloc, WeatherTodayState>(
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
        body(context, weatherTodayState),
      ],
    );
  }

  body(context, weatherTodayState) {
    return Scaffold(
      appBar: selectAppBarFromState(context, weatherTodayState),
      backgroundColor: Colors.transparent,
      drawer: buildNavigationDrawer(),
      body: selectBodyFromState(context, weatherTodayState),
    );
  }

  selectBodyFromState(context, weatherTodayState) {
    if (weatherTodayState is InitialWeatherTodayState) {
      BlocProvider.of<WeatherTodayBloc>(context).add(
        FetchWeatherTodayEvent(locationId: 455825),
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
    onTap: () {},
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
