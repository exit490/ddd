import 'package:flutter/material.dart';
import 'package:flutter_app/home/home_page.dart';
import 'package:flutter_app/meta_weather/meta_weather_api_client.dart';
import 'package:flutter_app/permission/location_permission_bloc.dart';
import 'package:flutter_app/weather/repository/weather_repository.dart';
import 'package:flutter_app/weather_today/bloc/weather_today_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

void main() {
  initiatingNoSqlHive();

  final metaWeatherApiClient = MetaWeatherApiClient(
    httpClient: http.Client(),
  );

  final weatherRepository = WeatherRepository(
    clientApiMetaWeather: metaWeatherApiClient,
  );

  final blocWeatherToday = BlocProvider(
    create: (context) => WeatherTodayBloc(
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

initiatingNoSqlHive() async {
  var dir = await getApplicationDocumentsDirectory();
  Hive.init(dir.path);
}
