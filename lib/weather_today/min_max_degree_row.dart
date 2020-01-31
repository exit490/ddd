import 'package:flutter/material.dart';

minMaxDegreeRow() {
  const FONT_SIZE = 22.0;

  var upIcon = Icon(
    Icons.arrow_upward,
    size: FONT_SIZE,
    color: Colors.white,
  );

  var maxDegreeText = Text(
    '34°',
    style: TextStyle(fontSize: FONT_SIZE),
  );

  var minDegreeText = Text(
    '26°',
    style: TextStyle(fontSize: FONT_SIZE),
  );

  var downIcon = Icon(
    Icons.arrow_downward,
    size: FONT_SIZE,
    color: Colors.white,
  );
  var padding = Padding(
    padding: EdgeInsets.only(left: 20),
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
