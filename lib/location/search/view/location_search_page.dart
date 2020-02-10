import 'package:flutter/material.dart';
import 'package:flutter_app/location/bloc/location_bloc.dart';
import 'package:flutter_app/location/bloc/location_event.dart';
import 'package:flutter_app/location/model/location_model.dart';
import 'package:flutter_app/location/search/bloc/search_location_bloc.dart';
import 'package:flutter_app/location/search/bloc/search_location_event.dart';
import 'package:flutter_app/location/search/bloc/search_location_state.dart';
import 'package:flutter_app/weather/view/weather_backgroud.dart';
import 'package:flutter_app/weather_forecast/bloc/weather_forecast_bloc.dart';
import 'package:flutter_app/weather_forecast/bloc/weather_forecast_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchLocationPage extends StatelessWidget {
  final TextEditingController _searchQuery = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    _searchQuery.addListener(() {
      searchLocation(context, _searchQuery.text.toString());
    });

    final scaffold = Scaffold(
      key: key,
      appBar: buildBar(context),
      body: body(),
    );

    return Stack(
      children: <Widget>[
        WeatherBackground(),
        scaffold,
      ],
    );
  }

  body() {
    final blocBuilder = BlocBuilder<SearchLocationBloc, SearchLocationState>(
        builder: (context, searchLocationState) {
      return _handlerLocationState(
        searchLocationState,
      );
    });

    return Container(
      child: blocBuilder,
    );
  }

  _handlerLocationState(searchLocationState) {
    if (searchLocationState is FoundLocationsState) {
      return buildListView(searchLocationState.locations);
    }

    return Container();
  }

  buildListView(List<LocationModel> locations) {
    final childItemList = locations
        .toList()
        .map(
          (location) => ChildItem(location),
        )
        .toList();
    return ListView(
      padding: new EdgeInsets.symmetric(vertical: 8.0),
      children: childItemList,
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
    BlocProvider.of<SearchLocationBloc>(context).add(TypingLocationEvent(
      location: location,
    ));
  }
}

class ChildItem extends StatelessWidget {
  final LocationModel locationModel;

  ChildItem(
    this.locationModel,
  );

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        this.locationModel.title,
      ),
      onTap: () => selectCity(context),
    );
  }

  selectCity(context) {
    storeLocationOnCache(context);
    fetchWeatherTodayEventToSelectedCity(context);
    Navigator.pop(context);
  }

  fetchWeatherTodayEventToSelectedCity(context) {
    BlocProvider.of<WeatherForecastBloc>(context).add(
      FetchWeatherForecastEvent(locationId: locationModel.woeid),
    );
  }

  storeLocationOnCache(context) {
    BlocProvider.of<LocationBloc>(context).add(
      StoreLocationOnCacheEvent(location: locationModel),
    );
  }
}
