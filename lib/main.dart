import 'package:flutter/material.dart';
import 'package:flutter_app/android_permissions/location_permission_bloc.dart';
import 'package:flutter_app/home/home_page.dart';
import 'package:flutter_app/location/bloc/location_bloc.dart';
import 'package:flutter_app/location/geo_location/geo_location_client.dart';
import 'package:flutter_app/location/model/location_model.dart';
import 'package:flutter_app/location/model/location_model_hive_adapter.dart';
import 'package:flutter_app/location/no_sql/location_nosql_client.dart';
import 'package:flutter_app/location/repository/location_repository.dart';
import 'package:flutter_app/meta_weather/meta_weather_api_client.dart';
import 'package:flutter_app/search/bloc/search_location_bloc.dart';
import 'package:flutter_app/weather/repository/weather_repository.dart';
import 'package:flutter_app/weather_forecast/bloc/weather_forecast_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:permission_handler/permission_handler.dart';

void main() async {
  await _initiatingNoSqlHive();

  final metaWeatherApiClient = MetaWeatherApiClient(
    httpClient: http.Client(),
  );

  final weatherRepository = WeatherRepository(
    clientApiMetaWeather: metaWeatherApiClient,
  );

  final weatherTodayBloc = BlocProvider(
    create: (context) => WeatherForecastBloc(
      weatherRepository: weatherRepository,
    ),
  );

  final locationPermissionBloc = BlocProvider(
    create: (context) => LocationPermissionBloc(
      permissionHandler: PermissionHandler(),
    ),
  );

  final locationRepository = await _configureLocationRepository(
    metaWeatherApiClient,
  );

  final locationBloc = BlocProvider(
    create: (context) => LocationBloc(
      locationRepository: locationRepository,
    ),
  );

  final searchLocationBloc = BlocProvider(
    create: (context) => SearchLocationBloc(
      locationRepository: locationRepository,
    ),
  );

  final multiBlocProvider = MultiBlocProvider(
    providers: [
      weatherTodayBloc,
      locationPermissionBloc,
      locationBloc,
      searchLocationBloc,
    ],
    child: HomePage(),
  );

  runApp(multiBlocProvider);
}

_configureLocationRepository(metaWeatherApiClient) async {
  final Box<LocationModel> locationBox =
      await Hive.openBox<LocationModel>('LocationModel');

  final locationNoSqlClient = LocationNoSqlClient(locationBox: locationBox);

  return LocationRepository(
    metaWeatherApiClient: metaWeatherApiClient,
    geoLocationApiClient: GeoLocationApiClient(),
    locationNoSqlClient: locationNoSqlClient,
  );
}

_initiatingNoSqlHive() async {
  await Hive.initFlutter();
  Hive.registerAdapter(LocationModelAdapter());
}
