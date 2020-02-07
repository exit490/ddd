import 'package:flutter/material.dart';

class LocationAppBar extends AppBar {
  final String locationName;
  final hasAddButton;

  LocationAppBar({
    @required this.locationName,
    @required this.hasAddButton,
  })  : assert(
          locationName != null,
          hasAddButton != null,
        ),
        super(
          title: Text(locationName),
          elevation: 20,
          centerTitle: true,
          backgroundColor: Colors.transparent,
          actions: whatActions(hasAddButton),
        );

  static whatActions(hasAddButton) {
    final actions = <Widget>[];
    if (hasAddButton) {
      actions.add(
        addButton(),
      );
    }

    return actions;
  }

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
