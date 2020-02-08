import 'package:flutter/material.dart';
import 'package:flutter_app/location/search/bloc/search_location_bloc.dart';
import 'package:flutter_app/location/search/bloc/search_location_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchLocationPage extends StatelessWidget {
  final TextEditingController _searchQuery = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    bool _isSearching = false;
    String _searchText = "";

    _searchQuery.addListener(() {
      searchLocation(context, _searchQuery.text.toString());
    });

    return Scaffold(
      key: key,
      appBar: buildBar(context),
      body: new ListView(
        padding: new EdgeInsets.symmetric(vertical: 8.0),
        children: _isSearching ? _buildSearchList(_searchText) : _buildList(),
      ),
    );
  }

  List<ChildItem> _buildList() {
    return getList()
        .map(
          (contact) => new ChildItem(contact),
        )
        .toList();
  }

  List<ChildItem> _buildSearchList(_searchText) {
    if (_searchText.isEmpty) {
      return getList().map((contact) => new ChildItem(contact)).toList();
    } else {
      List<String> _searchList = List();
      for (int i = 0; i < getList().length; i++) {
        String name = getList().elementAt(i);
        if (name.toLowerCase().contains(_searchText.toLowerCase())) {
          _searchList.add(name);
        }
      }
      return _searchList.map((contact) => ChildItem(contact)).toList();
    }
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

  List<String> getList() {
    final List<String> _list = List();
    _list.add("Google");
    _list.add("IOS");
    _list.add("Andorid");
    _list.add("Dart");
    _list.add("Flutter");
    _list.add("Python");
    _list.add("React");
    _list.add("Xamarin");
    _list.add("Kotlin");
    _list.add("Java");
    _list.add("RxAndroid");
    return _list;
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
