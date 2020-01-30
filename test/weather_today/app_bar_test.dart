import 'package:flutter/material.dart';
import 'package:flutter_app/weather_today/weather_today_page.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  var weatherTodayAppBarToTest;

  setUp(() {
    weatherTodayAppBarToTest = MaterialApp(
      home: Scaffold(
        appBar: weatherTodayAppBar(),
      ),
    );
  });

  testWidgets('location text in app bar expected', (WidgetTester tester) async {
    await tester.pumpWidget(weatherTodayAppBarToTest);

    final textToShow = 'São Pedro Da Aldeia';
    final titleFinder = find.text(textToShow);
    expect(titleFinder, findsOneWidget);
  });

  testWidgets('add button in app bar expected', (WidgetTester tester) async {
    await tester.pumpWidget(weatherTodayAppBarToTest);

    final addButton = find.byIcon(Icons.add);
    expect(addButton, findsOneWidget);
  });
}
