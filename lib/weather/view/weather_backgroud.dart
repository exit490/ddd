import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/weather/model/weather_model.dart';

class WeatherBackground extends StatelessWidget {
  final _assetsPath = 'assets/images/';
  final _jpg = '.jpg';
  final _totalImages = 1;
  final WeatherCondition condition;

  WeatherBackground({
    this.condition,
  }) : assert(condition != null);

  @override
  Widget build(BuildContext context) {
    final streamBuilder = StreamBuilder(
      builder: (context, snapshot) {
        return _backGroundImage(context);
      },
    );

    return Stack(
      children: <Widget>[
        streamBuilder,
        Container(
          color: Colors.black26,
        )
      ],
    );
  }

  _backGroundImage(context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Image.asset(
      _imagePath(),
      height: height,
      width: width,
      fit: BoxFit.cover,
    );
  }

  String _imagePath() {
    return _assetsPath + _getStringConditional() + '/' + _randomJpg();
  }

  String _getStringConditional() {
    return condition.toString().replaceAll('WeatherCondition.', '');
  }

  String _randomJpg() {
    final randomNumber = Random().nextInt(_totalImages);
    return randomNumber.toString() + _jpg;
  }
}
