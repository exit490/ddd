import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_app/location/model/location_model.dart';
import 'package:flutter_app/meta_weather/model/meta_weather_model.dart';
import 'package:flutter_app/weather/model/weather_model.dart';
import 'package:http/http.dart' as http;

class MetaWeatherApiClient {
  static const baseUrl = 'https://www.metaweather.com';
  final http.Client httpClient;

  MetaWeatherApiClient({
    @required this.httpClient,
  }) : assert(httpClient != null);

  Future<int> getLocationId(String city) async {
    final locationUrl = '$baseUrl/api/location/search/?query=$city';
    final locationResponse = await this.httpClient.get(locationUrl);

    if (locationResponse.statusCode != 200) {
      throw Exception('error getting locationId for city');
    }

    final locationJson = jsonDecode(locationResponse.body) as List;
    return (locationJson.first)['woeid'];
  }

  Future<List<LocationModel>> fetchLocationsByCityName(String city) async {
    final locationUrl = '$baseUrl/api/location/search/?query=$city';
    final locationResponse = await this.httpClient.get(locationUrl);

    if (locationResponse.statusCode != 200) {
      throw Exception('error getting locationId for city');
    }

    final locationJsonList = jsonDecode(locationResponse.body) as List;

    List<LocationModel> locationModelList = [];

    for (final locationJson in locationJsonList) {
      final locationModel = LocationModel.fromJson(locationJson);
      locationModelList.add(locationModel);
    }

    return locationModelList;
  }

  Future<Weather> fetchWeather(int locationId) async {
    final weatherUrl = '$baseUrl/api/location/$locationId';
    final weatherResponse = await this.httpClient.get(weatherUrl);

    if (weatherResponse.statusCode != 200) {
      throw Exception('error getting weather for location');
    }

    final weatherJson = jsonDecode(weatherResponse.body);
    return Weather.fromJson(weatherJson);
  }

  Future<MetaWeatherModel> fetchWeatherForecast(int locationId) async {
    final weatherUrl = '$baseUrl/api/location/$locationId';
    final weatherResponse = await this.httpClient.get(weatherUrl);

    if (weatherResponse.statusCode != 200) {
      throw Exception('error getting weather forecast for location');
    }

    final metaWeatherJson = jsonDecode(weatherResponse.body);
    return MetaWeatherModel.fromJson(metaWeatherJson);
  }

  Future<List<LocationModel>> fetchLocationsByLatLong(
      double lat, double long) async {
    final locationsUrl = '$baseUrl/api/location/search/?lattlong=$lat,$long';
    final locationResponse = await this.httpClient.get(locationsUrl);

    if (locationResponse.statusCode != 200) {
      throw Exception('error getting  locations');
    }

    final locationJsonList = jsonDecode(locationResponse.body) as List;

    List<LocationModel> locationModelList = [];

    for (final locationJson in locationJsonList) {
      final locationModel = LocationModel.fromJson(locationJson);
      locationModelList.add(locationModel);
    }

    return locationModelList;
  }
}
