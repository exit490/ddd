import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/location/bloc/event/to_store_location_in_cache_event.dart';
import 'package:flutter_app/location/bloc/location_bloc.dart';
import 'package:flutter_app/location/model/location_model.dart';
import 'package:flutter_app/weather_forecast/bloc/weather_forecast_bloc.dart';
import 'package:flutter_app/weather_forecast/bloc/weather_forecast_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CityNameListTile extends StatelessWidget {
  final LocationModel locationModel;

  CityNameListTile({@required this.locationModel});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(this.locationModel.title),
      onTap: () => _selectCity(context),
    );
  }

  _selectCity(context) {
    _storeLocationOnCache(context);
    _fetchWeatherTodayEventToSelectedCity(context);
    Navigator.pop(context);
  }

  _fetchWeatherTodayEventToSelectedCity(context) {
    BlocProvider.of<WeatherForecastBloc>(context).add(
      FetchWeatherForecastEvent(locationId: locationModel.woeid),
    );
  }

  _storeLocationOnCache(context) {
    BlocProvider.of<LocationBloc>(context).add(
      ToStoreLocationInCacheEvent(location: locationModel),
    );
  }
}
