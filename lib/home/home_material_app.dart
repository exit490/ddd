import 'package:flutter/material.dart';

class HomeMaterialApp extends MaterialApp {
  final context;

  HomeMaterialApp({
    home,
    this.context,
  })  : assert(context != null),
        super(
          theme: _buildTheme(context),
          home: home,
        );

  static _buildTheme(context) {
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
