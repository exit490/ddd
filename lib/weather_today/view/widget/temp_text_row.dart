import 'package:flutter/material.dart';

class TempText extends StatelessWidget {
  final double temp;
  static final _c = '°';

  TempText({
    @required this.temp,
  }) : assert(temp != null);

  @override
  Widget build(BuildContext context) {
    var degreeText = Text(
      temp.toInt().toString() + _c,
      style: TextStyle(fontSize: 150),
    );
    return Align(
      child: degreeText,
      alignment: Alignment.bottomLeft,
    );
  }
}
