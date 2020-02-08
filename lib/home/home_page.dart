import 'package:flutter/material.dart';
import 'package:flutter_app/permission/location_permission_bloc.dart';
import 'package:flutter_app/permission/location_permission_event.dart';
import 'package:flutter_app/permission/location_permission_state.dart';
import 'package:flutter_app/weather_today/view/weather_today_main_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final newTextTheme = Theme.of(context).textTheme.apply(
          bodyColor: Colors.white,
          displayColor: Colors.white,
        );

    final theme = ThemeData(
      textTheme: newTextTheme,
      canvasColor: Colors.black26,
    );

    return MaterialApp(
      theme: theme,
      home: main(),
    );
  }

  main() {
    final blocBuilder =
        BlocBuilder<BlocLocationPermission, LocationPermissionState>(
      builder: (context, locationPermissionState) {
        return _handlerCheckLocationPermissionState(
          context,
          locationPermissionState,
        );
      },
    );

    return Container(
      child: blocBuilder,
    );
  }

  body() {
    final textStyle = TextStyle(fontSize: 50);
    final text1 = Text(
      'FLUTTER',
      style: textStyle,
    );
    final text2 = Text(
      'WEATHER APP',
      style: textStyle,
    );

    final column = Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        text1,
        text2,
      ],
    );

    final center = Center(
      child: column,
    );

    return Scaffold(
      body: center,
    );
  }

  requestLocationPermission(context) {
    BlocProvider.of<BlocLocationPermission>(context)
        .add(RequestLocationPermissionEvent());
  }

  checkLocationPermission(context) {
    BlocProvider.of<BlocLocationPermission>(context)
        .add(CheckLocationPermissionEvent());
  }

  _handlerCheckLocationPermissionState(context, locationPermissionState) {
    if (locationPermissionState is InitialLocationPermissionState) {
      checkLocationPermission(context);
      return body();
    }

    if (locationPermissionState is DisabledLocationPermissionState) {
      requestLocationPermission(context);
      return body();
    }

    if (locationPermissionState is GrantedLocationPermissionState) {
      return WeatherTodayMainPage();
    }

    if (locationPermissionState is NeverAskAgainLocationPermissionState) {
      return WeatherTodayMainPage();
    }

    if (locationPermissionState is RestrictedLocationPermissionState) {
      return WeatherTodayMainPage();
    }
  }
}
