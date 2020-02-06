import 'package:flutter/material.dart';

class TempText extends StatelessWidget {
  final double temp;

  TempText({
    @required this.temp,
  }) : assert(temp != null);

  @override
  Widget build(BuildContext context) {
    var degreeText = Text(
      temp.toInt().toString(),
      style: TextStyle(fontSize: 150),
    );
    return Align(
      child: degreeText,
      alignment: Alignment.bottomLeft,
    );
  }
}
