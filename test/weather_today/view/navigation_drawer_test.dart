import 'package:flutter/material.dart';
import 'package:flutter_app/weather_today/view/weather_today_main_page.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  var weatherTodayPage;

  setUp(() {
    weatherTodayPage = MaterialApp(
      home: WeatherTodayMainPage(),
    );
  });

  testWidgets('location text in app bar expected', (WidgetTester tester) async {
    await tester.pumpWidget(weatherTodayPage);

    final textToShow = 'São Pedro Da Aldeia';
    final titleFinder = find.text(textToShow);
    expect(titleFinder, findsOneWidget);
  });
}
