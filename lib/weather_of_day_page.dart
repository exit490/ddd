import 'package:flutter/material.dart';

class WeatherOfDayPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        pageBackground(context),
        mainStruct(),
      ],
    );
  }
}

mainStruct() {
  return Scaffold(
    appBar: appBar(),
    backgroundColor: Colors.transparent,
  );
}

pageBackground(context) {
  return Image.asset(
    "assets/images/cloudy_1.jpg",
    height: MediaQuery.of(context).size.height,
    width: MediaQuery.of(context).size.width,
    fit: BoxFit.cover,
  );
}

appBar() {
  return AppBar(
    backgroundColor: Colors.transparent,
    title: Text('São Pedro Da Aldeia'),
    centerTitle: true,
    elevation: 20,
  );
}
