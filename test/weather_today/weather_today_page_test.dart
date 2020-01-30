// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_app/weather_today/weather_today_page.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('location text in app bar expected', (WidgetTester tester) async {
    final materialApp = MaterialApp(
      home: Scaffold(
        appBar: weatherTodayAppBar(),
      ),
    );

    await tester.pumpWidget(materialApp);

    final textToShow = 'São Pedro Da Aldeia';

    final titleFinder = find.text(textToShow);
    expect(titleFinder, findsOneWidget);
  });
}
