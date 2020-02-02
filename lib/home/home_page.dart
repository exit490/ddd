import 'package:flutter/material.dart';
import 'package:flutter_app/weather/repository/weather_repository.dart';
import 'package:flutter_app/weather_today/bloc/weather_today_bloc.dart';
import 'package:flutter_app/weather_today/view/weather_today_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  final WeatherRepository weatherRepository;

  HomePage({Key key, @required this.weatherRepository})
      : assert(weatherRepository != null),
        super(key: key);

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
      home: weatherBlocProvider(),
    );
  }

  weatherBlocProvider() {
    return BlocProvider(
      create: (context) => WeatherTodayBloc(
        weatherRepository: weatherRepository,
      ),
      child: WeatherTodayPage(),
    );
  }
}
