import 'package:flutter/material.dart';
import 'package:flutter_app/location/bloc/location_bloc.dart';
import 'package:flutter_app/location/bloc/location_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LocationsNavigationDrawer extends Drawer {
  LocationsNavigationDrawer()
      : super(
          child: blocBuild(),
        );

  static blocBuild() {
    final blocBuilder = BlocBuilder<LocationBloc, LocationState>(
      builder: (context, weatherTodayState) {
        return buildLocationList();
      },
    );

    return Container(
      child: blocBuilder,
    );
  }

  static buildLocationList() {
    var listTile1 = ListTile(
      title: Text('São pedro da Aldeia'),
    );

    var listTile2 = ListTile(
      title: Text('São pedro da Aldeia'),
      onTap: () {},
    );

    var listView = ListView(
      children: <Widget>[
        listTile1,
        listTile2,
      ],
    );

    return listView;
  }
}
