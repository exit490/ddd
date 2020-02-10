import 'package:flutter/material.dart';

class HomeMaterialApp extends StatelessWidget {
  final home;

  HomeMaterialApp({
    this.home,
  }) : assert(home != null);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: home,
      theme: _buildTheme(context),
    );
  }

  _buildTheme(context) {
    final newTextTheme = Theme.of(context).textTheme.apply(
          bodyColor: Colors.white,
          displayColor: Colors.white,
        );

    return ThemeData(
      textTheme: newTextTheme,
      canvasColor: Colors.black26,
    );
  }
}
