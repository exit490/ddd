import 'package:flutter/material.dart';
import 'package:flutter_app/permission/location_permission_bloc.dart';
import 'package:flutter_app/permission/location_permission_event.dart';
import 'package:flutter_app/permission/location_permission_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    checkLocationPermission(context);

    final newTextTheme = Theme.of(context).textTheme.apply(
          bodyColor: Colors.white,
          displayColor: Colors.white,
        );

    final theme = ThemeData(
      textTheme: newTextTheme,
      canvasColor: Colors.black26,
    );

    return MaterialApp(
      theme: theme,
      home: main(),
    );
  }

  main() {
    final blocBuilder =
        BlocBuilder<BlocLocationPermission, LocationPermissionState>(
      builder: (context, locationPermissionState) {
        _handlerCheckLocationPermissionState(context, locationPermissionState);

        return body();
      },
    );

    return Container(
      child: blocBuilder,
    );
  }

  body() {
    final textStyle = TextStyle(fontSize: 50);
    final text1 = Text(
      'FLUTTER',
      style: textStyle,
    );
    final text2 = Text(
      'WEATHER APP',
      style: textStyle,
    );

    final column = Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        text1,
        text2,
      ],
    );

    final center = Center(
      child: column,
    );

    return Scaffold(
      body: center,
    );
  }

  requestLocationPermission(context) {
    BlocProvider.of<BlocLocationPermission>(context)
        .add(RequestLocationPermissionEvent());
  }

  checkLocationPermission(context) {
    BlocProvider.of<BlocLocationPermission>(context)
        .add(CheckLocationPermissionEvent());
  }

  _handlerCheckLocationPermissionState(context, locationPermissionState) {
    if (locationPermissionState is DisabledLocationPermissionState) {
      requestLocationPermission(context);
    }

//      case is Di:
//        requestLocationPermission(context);
//        break;
//      case PermissionStatus.granted:
//        break;
//      case PermissionStatus.disabled:
//        break;
//      case PermissionStatus.restricted:
//        break;
//      case PermissionStatus.neverAskAgain:
//        break;
//      default:
//    }
  }
}
