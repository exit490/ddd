import 'package:flutter/material.dart';
import 'package:flutter_app/weather_today/view/page_main_weather_today.dart';
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
}
