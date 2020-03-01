import 'package:flutter_app/home/view/home_page_view.dart';
import 'package:flutter_app/location/bloc/event/request_all_locations_event.dart';
import 'package:flutter_app/location/bloc/location_bloc.dart';
import 'package:flutter_app/location/bloc/state/all_locations_requested_state.dart';
import 'package:flutter_app/location/bloc/state/initial_location_state.dart';
import 'package:flutter_app/location/bloc/state/location_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../view/home_body.dart';

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

    if (locationState is AllLocationsRequestedState) {
      return HomePageView(
        locationState.locations,
      );
    }
  }
}
