import 'package:flutter/material.dart';
import 'package:flutter_app/location/search/bloc/search_location_bloc.dart';
import 'package:flutter_app/location/search/bloc/search_location_event.dart';
import 'package:flutter_app/location/search/bloc/search_location_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchLocationPage extends StatelessWidget {
  final TextEditingController _searchQuery = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    _searchQuery.addListener(() {
      searchLocation(context, _searchQuery.text.toString());
    });

    return Scaffold(
      key: key,
      appBar: buildBar(context),
      body: body(),
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
      buildListView(searchLocationState.locations);
    }
  }

  buildListView(locations) {
    ListView(
      padding: new EdgeInsets.symmetric(vertical: 8.0),
      children: [],
    );
  }

  Widget buildBar(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      centerTitle: true,
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
  final String name;

  ChildItem(this.name);

  @override
  Widget build(BuildContext context) {
    return ListTile(title: Text(this.name));
  }
}
