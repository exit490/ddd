import 'package:flutter/material.dart';

class WeatherOfDayPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        weatherBackground(context),
        mainStruct(),
      ],
    );
  }
}

mainStruct() {
  return Scaffold(
    appBar: appBar(),
    backgroundColor: Colors.transparent,
    drawer: buildNavigationDrawer(),
  );
}

weatherBackground(context) {
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

buildNavigationDrawer() {
  var drawerHeader = DrawerHeader(
      child: Text('Drawer Header'),
      decoration: BoxDecoration(
        color: Colors.blue,
      ));

  var listTile1 = ListTile(
    title: Text('São pedro da Aldeia'),
  );

  var listTile2 = ListTile(
    title: Text('São pedro da Aldeia'),
  );

  var listView = ListView(
    padding: EdgeInsets.zero,
    children: <Widget>[
      drawerHeader,
      listTile1,
      listTile2,
    ],
  );

  return Drawer(
    child: listView,
  );
}
