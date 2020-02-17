import 'package:flutter/material.dart';
import 'package:flutter_app/search/bloc/search_location_bloc.dart';
import 'package:flutter_app/search/event/typing_city_name_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchLocationAppBar extends AppBar {
  final context;

  SearchLocationAppBar({
    @required this.context,
  }) : super(
          automaticallyImplyLeading: false,
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: _cityNameTextField(context),
        );

  static _cityNameTextField(context) {
    return TextField(
      controller: _searchQuery(context),
      cursorColor: Colors.white,
      style: TextStyle(
        color: Colors.white,
      ),
      decoration: _inputDecoration(),
    );
  }

  static _inputDecoration() {
    return InputDecoration(
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
        ));
  }

  static _searchQuery(context) {
    final cityNameController = TextEditingController();

    cityNameController.addListener(() {
      _searchLocation(context, cityNameController.text.trim());
    });

    return cityNameController;
  }

  static _searchLocation(context, cityName) {
    if (cityName.isEmpty) {
      return;
    }
    BlocProvider.of<SearchLocationBloc>(context)
        .add(TypingCityNameEvent(cityName: cityName));
  }
}
