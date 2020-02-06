import 'package:flutter/material.dart';
import 'package:flutter_app/weather_today/bloc/bloc_weather_today.dart';
import 'package:flutter_app/weather_today/bloc/event_weather_today.dart';
import 'package:flutter_app/weather_today/bloc/state_weather_today.dart';
import 'package:flutter_app/weather_today/view/loaded_body_weather_today.dart';
import 'package:flutter_app/weather_today/view/loading_body_weather_today.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WeatherTodayPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<BlocWeatherToday>(context).add(
      FetchWeatherTodayEvent(locationId: 455825),
    );

    return Stack(
      children: <Widget>[
        weatherBackground(context),
        mainStruct(),
      ],
    );
  }
}

mainStruct() {
  return Scaffold(
    appBar: weatherTodayAppBar(),
    backgroundColor: Colors.transparent,
    drawer: buildNavigationDrawer(),
    body: bodyStruct(),
  );
}

bodyStruct() {
  final blocBuilder = BlocBuilder<BlocWeatherToday, StateWeatherToday>(
    builder: (context, weatherTodayState) {
      return selectViewFromWeatherTodayState(weatherTodayState);
    },
  );

  return Container(
    child: blocBuilder,
  );
}

selectViewFromWeatherTodayState(weatherTodayState) {
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

weatherBackground(context) {
  return Image.asset(
    "assets/images/cloudy_1.jpg",
    height: MediaQuery.of(context).size.height,
    width: MediaQuery.of(context).size.width,
    fit: BoxFit.cover,
  );
}

weatherTodayAppBar() {
  return AppBar(
    backgroundColor: Colors.transparent,
    title: Text('São Pedro Da Aldeia'),
    centerTitle: true,
    elevation: 20,
    actions: <Widget>[
      addButton(),
    ],
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

addButton() {
  var addIcon = Icon(
    Icons.add,
    size: 30,
  );

  return IconButton(
    icon: addIcon,
    onPressed: () {},
  );
}
