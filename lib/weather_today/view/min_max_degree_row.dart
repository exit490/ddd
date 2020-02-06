import 'package:flutter/material.dart';

class MinMaxDegreeRow extends StatelessWidget {
  final double minDegree;
  final double maxDegree;
  static final fontSize = 22.0;

  MinMaxDegreeRow({
    @required this.minDegree,
    @required this.maxDegree,
  }) : assert(minDegree != null, maxDegree != null);

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
      maxDegree.toString(),
      style: TextStyle(fontSize: fontSize),
    );

    final minDegreeText = Text(
      minDegree.toString(),
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
