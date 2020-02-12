import 'package:flutter/cupertino.dart';
import 'package:flutter_app/location/model/location_model.dart';
import 'package:flutter_app/weather/view/weather_backgroud.dart';
import 'package:flutter_app/weather_forecast/weather_forecast_main_page.dart';
import 'package:flutter_app/weather_today/view/weather_today_main_page.dart';

class HomePageView extends StatelessWidget {
  final List<LocationModel> locations;

  HomePageView(
    this.locations,
  );

  @override
  Widget build(BuildContext context) {
    final pageController = PageController(initialPage: 0);

    final weatherTodayPage = WeatherTodayMainPage(
      locations: locations,
    );

    final pageView = PageView(
      controller: pageController,
      scrollDirection: Axis.vertical,
      children: <Widget>[
        weatherTodayPage,
        WeatherForecastMainPage(),
      ],
    );

    return Stack(
      children: <Widget>[
        WeatherBackground(),
        pageView,
      ],
    );
  }
}
