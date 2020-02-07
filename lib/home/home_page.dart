import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final newTextTheme = Theme.of(context).textTheme.apply(
          bodyColor: Colors.white,
          displayColor: Colors.white,
        );

    final theme = ThemeData(
      textTheme: newTextTheme,
      canvasColor: Colors.black26,
    );

    return MaterialApp(
      theme: theme,
      home: main(),
    );
  }

  main() {
    final textStyle = TextStyle(fontSize: 50);
    final text1 = Text(
      'FLUTTER',
      style: textStyle,
    );
    final text2 = Text(
      'WEATHER APP',
      style: textStyle,
    );

    final column = Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        text1,
        text2,
      ],
    );

    final center = Center(
      child: column,
    );

    return Scaffold(
      body: center,
    );
  }
}
