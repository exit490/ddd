import 'package:flutter/material.dart';
import 'package:flutter_app/weather_today/weather_today_page.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  var weatherTodayPage;

  setUp(() {
    weatherTodayPage = MaterialApp(
      home: WeatherTodayPage(),
    );
  });

  testWidgets('location text in app bar expected', (WidgetTester tester) async {
    await tester.pumpWidget(weatherTodayPage);

    final textToShow = 'São Pedro Da Aldeia';
    final titleFinder = find.text(textToShow);
    expect(titleFinder, findsOneWidget);
  });

  testWidgets('add button in app bar expected', (WidgetTester tester) async {
    await tester.pumpWidget(weatherTodayPage);

    final addButton = find.byIcon(Icons.add);
    expect(addButton, findsOneWidget);
  });

  testWidgets('navigation drawer button in app bar expected',
      (WidgetTester tester) async {
    await tester.pumpWidget(weatherTodayPage);

    final navButton = find.byIcon(Icons.menu);
    expect(navButton, findsOneWidget);
  });
}
