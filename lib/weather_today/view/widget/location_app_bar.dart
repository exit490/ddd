import 'package:flutter/material.dart';
import 'package:flutter_app/location/search/view/location_search_page.dart';

class LocationAppBar extends AppBar {
  final String locationName;
  final enableAddButton;
  final context;

  LocationAppBar({
    @required this.locationName,
    @required this.enableAddButton,
    @required this.context,
  }) : super(
          title: Text(locationName),
          elevation: 0,
          centerTitle: true,
          backgroundColor: Colors.transparent,
          actions: whatActions(
            context,
            enableAddButton,
          ),
        );

  static whatActions(context, enableAddButton) {
    final actions = <Widget>[];
    if (enableAddButton) {
      actions.add(
        addButton(context),
      );
    }

    return actions;
  }

  static addButton(context) {
    var addIcon = Icon(
      Icons.add,
      size: 30,
    );

    return IconButton(
      icon: addIcon,
      onPressed: () {
        callSearchLocationPage(context);
      },
    );
  }

  static callSearchLocationPage(context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SearchLocationPage()),
    );
  }
}
