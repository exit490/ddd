import 'package:flutter/material.dart';
import 'package:flutter_app/location/model/location_model.dart';
import 'package:flutter_app/weather_today/bloc/weather_today_bloc.dart';
import 'package:flutter_app/weather_today/bloc/weather_today_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LocationsNavigationDrawer extends Drawer {
  final context;
  final locations;

  LocationsNavigationDrawer(
    this.context,
    this.locations,
  )   : assert(context != null && locations != null),
        super(
          child: buildLocationList(context, locations),
        );

  static buildLocationList(context, locations) {
    if (locations.isEmpty) {
      return ListView(
        padding: EdgeInsets.symmetric(vertical: 8.0),
        children: [],
      );
    }

    final childItemList = locations
        .toList()
        .map(
          (location) => LocationChildItem(location),
        )
        .toList();
    return ListView(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      children: childItemList,
    );
  }
}

class LocationChildItem extends StatelessWidget {
  final LocationModel locationModel;

  LocationChildItem(
    this.locationModel,
  );

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        this.locationModel.title,
      ),
      onTap: () => selectCity(context),
    );
  }

  selectCity(context) {
    fetchWeatherTodayEventToSelectedCity(context);
  }

  fetchWeatherTodayEventToSelectedCity(context) {
    BlocProvider.of<WeatherTodayBloc>(context).add(
      FetchWeatherTodayEvent(locationId: locationModel.woeid),
    );
  }
}