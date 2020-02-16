import 'package:flutter/material.dart';
import 'package:flutter_app/location/model/location_model.dart';
import 'package:flutter_app/search/bloc/search_location_bloc.dart';
import 'package:flutter_app/search/bloc/search_location_state.dart';
import 'package:flutter_app/search/view/city_name_list_tile.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchLocationBuilder
    extends BlocBuilder<SearchLocationBloc, SearchLocationState> {
  SearchLocationBuilder.handleState()
      : super(builder: (context, searchLocationState) {
          return _handle(context, searchLocationState);
        });

  static _handle(context, searchLocationState) {
    if (searchLocationState is FoundLocationsState) {
      return _buildListView(searchLocationState.locations);
    }

    return Container();
  }

  static _buildListView(List<LocationModel> locations) {
    locations.toList().map((location) => CityNameListTile(location)).toList();
    return ListView(
      padding: new EdgeInsets.symmetric(vertical: 8.0),
      children:
          locations.map((location) => CityNameListTile(location)).toList(),
    );
  }
}
