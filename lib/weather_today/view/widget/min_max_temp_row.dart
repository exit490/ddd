import 'package:flutter/material.dart';

class MinMaxTempRow extends StatelessWidget {
  final double minTemp;
  final double maxTemp;
  static final fontSize = 22.0;
  static final _c = '°';

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
    final textStyle = TextStyle(fontSize: fontSize);

    final maxTempText = Text(
      maxTemp.toInt().toString() + _c,
      style: textStyle,
    );

    final minTempText = Text(
      minTemp.toInt().toString() + _c,
      style: textStyle,
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
