import 'package:flutter/material.dart';
import 'package:flutter_app/search/view/search_location_app_bar.dart';
import 'package:flutter_app/search/view/search_location_builder.dart';
import 'package:flutter_app/weather/view/weather_backgroud.dart';

class SearchLocationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        WeatherBackground(),
        Scaffold(
          appBar: SearchLocationAppBar(context: context),
          body: SearchLocationBuilder.handleState(),
        ),
      ],
    );
  }
}
