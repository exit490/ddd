import 'package:flutter/material.dart';
import 'package:flutter_app/location/bloc/location_bloc.dart';
import 'package:flutter_app/location/bloc/location_event.dart';
import 'package:flutter_app/location/bloc/location_state.dart';
import 'package:flutter_app/permission/location_permission_bloc.dart';
import 'package:flutter_app/permission/location_permission_event.dart';
import 'package:flutter_app/permission/location_permission_state.dart';
import 'package:flutter_app/weather_forecast/weather_forecast_main_page.dart';
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
        BlocBuilder<LocationPermissionBloc, LocationPermissionState>(
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

  pageView(locations) {
    final pageController = PageController(initialPage: 0);

    final weatherTodayPage = WeatherTodayMainPage(
      locations: locations,
    );

    final weatherForecastPage = WeatherForecastMainPage(
      locations: locations,
    );

    return PageView(
      controller: pageController,
      scrollDirection: Axis.vertical,
      children: <Widget>[
        weatherTodayPage,
        weatherForecastPage,
      ],
    );
  }

  locationBlocBuilder() {
    return BlocBuilder<LocationBloc, LocationState>(
      builder: (context, locationState) {
        return _handlerLocationsState(context, locationState);
      },
    );
  }

  _handlerLocationsState(context, locationState) {
    if (locationState is InitialLocationState) {
      BlocProvider.of<LocationBloc>(context).add(BuildAllLocationEvent());
      return body();
    }

    if (locationState is AllLocationsRestoredState) {
      return pageView(
        locationState.locations,
      );
    }
  }

  requestLocationPermission(context) {
    BlocProvider.of<LocationPermissionBloc>(context)
        .add(RequestLocationPermissionEvent());
  }

  checkLocationPermission(context) {
    BlocProvider.of<LocationPermissionBloc>(context)
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
      return locationBlocBuilder();
    }

    if (locationPermissionState is NeverAskAgainLocationPermissionState) {
      return locationBlocBuilder();
    }

    if (locationPermissionState is RestrictedLocationPermissionState) {
      return;
    }
  }
}
