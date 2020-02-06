import 'package:flutter/material.dart';

class MinMaxTempRow extends StatelessWidget {
  final double minTemp;
  final double maxTemp;
  static final fontSize = 22.0;

  MinMaxTempRow({
    @required this.minTemp,
    @required this.maxTemp,
  }) : assert(minTemp != null, maxTemp != null);

  final upIcon = Icon(
    Icons.arrow_upward,
    size: fontSize,
    color: Colors.white,
  );

  final padding = Padding(
    padding: EdgeInsets.only(left: 20),
  );

  final downIcon = Icon(
    Icons.arrow_downward,
    size: fontSize,
    color: Colors.white,
  );

  @override
  Widget build(BuildContext context) {
    final maxDegreeText = Text(
      maxTemp.toString(),
      style: TextStyle(fontSize: fontSize),
    );

    final minDegreeText = Text(
      minTemp.toString(),
      style: TextStyle(fontSize: fontSize),
    );

    return Row(
      children: <Widget>[
        upIcon,
        maxDegreeText,
        padding,
        downIcon,
        minDegreeText,
      ],
    );
  }
}
