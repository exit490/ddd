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
    final maxTempText = Text(
      maxTemp.toInt().toString(),
      style: TextStyle(fontSize: fontSize),
    );

    final minTempText = Text(
      minTemp.toInt().toString(),
      style: TextStyle(fontSize: fontSize),
    );

    return Row(
      children: <Widget>[
        upIcon,
        maxTempText,
        padding,
        downIcon,
        minTempText,
      ],
    );
  }
}
