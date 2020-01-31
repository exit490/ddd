import 'package:flutter/material.dart';

class WeatherTodayPage extends StatelessWidget {
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
    appBar: weatherTodayAppBar(),
    backgroundColor: Colors.transparent,
    drawer: buildNavigationDrawer(),
    body: bodyStruct(),
  );
}

bodyStruct() {
  var column = Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisSize: MainAxisSize.max,
    mainAxisAlignment: MainAxisAlignment.end,
    children: <Widget>[
      degreeText(),
    ],
  );

  return Padding(
    padding: EdgeInsets.only(left: 15),
    child: column,
  );
}

degreeText() {
  var degreeText = Text(
    '28°',
    style: TextStyle(fontSize: 150),
  );

  return Align(
    child: degreeText,
    alignment: Alignment.bottomLeft,
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

weatherTodayAppBar() {
  return AppBar(
    backgroundColor: Colors.transparent,
    title: Text('São Pedro Da Aldeia'),
    centerTitle: true,
    elevation: 20,
    actions: <Widget>[
      addButton(),
    ],
  );
}

buildNavigationDrawer() {
  var listTile1 = ListTile(
    title: Text('São pedro da Aldeia'),
  );

  var listTile2 = ListTile(
    title: Text('São pedro da Aldeia'),
  );

  var listView = ListView(
    padding: EdgeInsets.zero,
    children: <Widget>[
      listTile1,
      listTile2,
    ],
  );

  return Drawer(
    child: listView,
  );
}

addButton() {
  var addIcon = Icon(
    Icons.add,
    size: 30,
  );

  return IconButton(
    icon: addIcon,
    onPressed: () {},
  );
}
