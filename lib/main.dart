import 'package:flutter/material.dart';
import 'package:flutter_app/home/home_page.dart';
import 'package:flutter_app/meta_weather/meta_weather_api_client.dart';
import 'package:flutter_app/weather/repository/weather_repository.dart';
import 'package:flutter_app/weather_today/bloc/bloc_weather_today.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

void main() {
  final metaWeatherApiClient = MetaWeatherApiClient(
    httpClient: http.Client(),
  );

  final weatherRepository = WeatherRepository(
    metaWeatherApiClient: metaWeatherApiClient,
  );

  final weatherTodayBlocProvider = BlocProvider(
    create: (context) => BlocWeatherToday(
      weatherRepository: weatherRepository,
    ),
  );

  final multiBlocProvider = MultiBlocProvider(
    providers: [
      weatherTodayBlocProvider,
    ],
    child: HomePage(),
  );

  runApp(multiBlocProvider);
}
