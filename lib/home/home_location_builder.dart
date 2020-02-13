import 'package:flutter_app/home/home_page_view.dart';
import 'package:flutter_app/location/bloc/event/request_all_locations_event.dart';
import 'package:flutter_app/location/bloc/location_bloc.dart';
import 'package:flutter_app/location/bloc/location_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'home_body.dart';

class HomeLocationBuilder extends BlocBuilder<LocationBloc, LocationState> {
  HomeLocationBuilder.handlerState()
      : super(builder: (context, locationState) {
          return _handle(context, locationState);
        });

  static _handle(context, locationState) {
    if (locationState is InitialLocationState) {
      BlocProvider.of<LocationBloc>(context).add(RequestAllLocationsEvent());
      return HomeBody();
    }

    if (locationState is AllLocationsRestoredState) {
      return HomePageView(
        locationState.locations,
      );
    }
  }
}
