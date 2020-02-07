import 'package:flutter/material.dart';
import 'package:flutter_app/home/home_page.dart';
import 'package:flutter_app/meta_weather/api_client_meta_weather.dart';
import 'package:flutter_app/permission/bloc_permission_location.dart';
import 'package:flutter_app/weather/repository/weather_repository.dart';
import 'package:flutter_app/weather_today/bloc/bloc_weather_today.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:permission_handler/permission_handler.dart';

void main() {
  final metaWeatherApiClient = MetaWeatherApiClient(
    httpClient: http.Client(),
  );

  final weatherRepository = WeatherRepository(
    clientApiMetaWeather: metaWeatherApiClient,
  );

  final blocWeatherToday = BlocProvider(
    create: (context) => BlocWeatherToday(
      weatherRepository: weatherRepository,
    ),
  );

  final blocLocationPermission = BlocProvider(
    create: (context) => BlocLocationPermission(
      permissionHandler: PermissionHandler(),
    ),
  );

  final multiBlocProvider = MultiBlocProvider(
    providers: [
      blocWeatherToday,
      blocLocationPermission,
    ],
    child: HomePage(),
  );

  runApp(multiBlocProvider);
}
