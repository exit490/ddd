import 'package:flutter/material.dart';

class LocationAppBar extends AppBar {
  final String locationName;
  final enableAddButton;

  LocationAppBar({
    @required this.locationName,
    @required this.enableAddButton,
  })  : assert(
          locationName != null,
          enableAddButton != null,
        ),
        super(
          title: Text(locationName),
          elevation: 20,
          centerTitle: true,
          backgroundColor: Colors.transparent,
          actions: whatActions(enableAddButton),
        );

  static whatActions(enableAddButton) {
    final actions = <Widget>[];
    if (enableAddButton) {
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
