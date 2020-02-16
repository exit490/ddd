import 'package:flutter/material.dart';
import 'package:flutter_app/location/bloc/event/to_store_location_in_cache_event.dart';
import 'package:flutter_app/location/bloc/location_bloc.dart';
import 'package:flutter_app/location/model/location_model.dart';
import 'package:flutter_app/search/bloc/search_location_bloc.dart';
import 'package:flutter_app/search/bloc/search_location_event.dart';
import 'package:flutter_app/search/bloc/search_location_state.dart';
import 'package:flutter_app/search/view/search_location_builder.dart';
import 'package:flutter_app/weather/view/weather_backgroud.dart';
import 'package:flutter_app/weather_forecast/bloc/weather_forecast_bloc.dart';
import 'package:flutter_app/weather_forecast/bloc/weather_forecast_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchLocationPage extends StatelessWidget {
  final TextEditingController _searchQuery = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    _searchQuery.addListener(() {
      searchLocation(context, _searchQuery.text.toString().trim());
    });

    final scaffold = Scaffold(
      key: key,
      appBar: buildBar(context),
      body: SearchLocationBuilder.handleState(),
    );

    return Stack(
      children: <Widget>[
        WeatherBackground(),
        scaffold,
      ],
    );
  }

  Widget buildBar(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      centerTitle: true,
      elevation: 0,
      backgroundColor: Colors.transparent,
      title: TextField(
        controller: _searchQuery,
        cursorColor: Colors.white,
        style: TextStyle(
          color: Colors.white,
        ),
        decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.search,
              color: Colors.white,
            ),
            hintText: "Enter city name ..",
            focusColor: Colors.white,
            fillColor: Colors.white,
            hoverColor: Colors.white,
            hintStyle: TextStyle(
              color: Colors.white,
            )),
      ),
    );
  }

  searchLocation(context, location) {
    if (location.isEmpty) {
      return;
    }
    BlocProvider.of<SearchLocationBloc>(context).add(TypingLocationEvent(
      location: location,
    ));
  }
}
