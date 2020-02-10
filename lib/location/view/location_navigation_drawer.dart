import 'package:flutter/material.dart';
import 'package:flutter_app/location/model/location_model.dart';
import 'package:flutter_app/weather_forecast/bloc/weather_forecast_bloc.dart';
import 'package:flutter_app/weather_forecast/bloc/weather_forecast_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LocationsNavigationDrawer extends StatelessWidget {
  final List<LocationModel> locations;

  LocationsNavigationDrawer(
    this.locations,
  ) : assert(locations != null);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: buildLocationList(context, locations),
    );
  }

  static buildLocationList(context, List<LocationModel> locations) {
    if (locations.isEmpty) {
      return ListView(
        padding: EdgeInsets.symmetric(vertical: 8.0),
        children: [],
      );
    }

    final List<LocationChildItem> childItemList = locations
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
    BlocProvider.of<WeatherForecastBloc>(context).add(
      FetchWeatherForecastEvent(locationId: locationModel.woeid),
    );
  }
}
