import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WeatherBackground extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final images = Image.asset(
      "assets/images/clear/1.jpg",
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      fit: BoxFit.cover,
    );

    return Stack(
      children: <Widget>[
        images,
        Container(
          color: Colors.black26,
        )
      ],
    );
  }
}
