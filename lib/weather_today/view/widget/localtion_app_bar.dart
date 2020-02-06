import 'package:flutter/material.dart';

class LocationAppBar extends AppBar {
  final String locationName;

  LocationAppBar({
    @required this.locationName,
  })  : assert(locationName != null),
        super(
          title: Text(locationName),
          elevation: 20,
          centerTitle: true,
          backgroundColor: Colors.transparent,
          actions: <Widget>[
            addButton(),
          ],
        );

  static addButton() {
    var addIcon = Icon(
      Icons.add,
      size: 30,
    );

    return IconButton(
      icon: addIcon,
      onPressed: () {},
    );
  }
}
