import 'package:equatable/equatable.dart';

import 'consolidate_weather.dart';
import 'parent_model.dart';
import 'sources_model.dart';

class MetaWeatherModel extends Equatable {
  final List<ConsolidatedWeather> consolidatedWeather;
  final String time;
  final String sunRise;
  final String sunSet;
  final String timezoneName;
  final Parent parent;
  final List<Sources> sources;
  final String title;
  final String locationType;
  final int woeid;
  final String lattLong;
  final String timezone;

  MetaWeatherModel({
    this.consolidatedWeather,
    this.time,
    this.sunRise,
    this.sunSet,
    this.timezoneName,
    this.parent,
    this.sources,
    this.title,
    this.locationType,
    this.woeid,
    this.lattLong,
    this.timezone,
  });

  @override
  List<Object> get props => [
        consolidatedWeather,
        time,
        sunRise,
        sunSet,
        timezoneName,
        parent,
        sources,
        title,
        locationType,
        woeid,
        lattLong,
        timezone,
      ];

  static fromJson(Map<String, dynamic> json) {
    var consolidatedWeather = List<ConsolidatedWeather>();
    if (json['consolidated_weather'] != null) {
      json['consolidated_weather'].forEach((v) {
        consolidatedWeather.add(ConsolidatedWeather.fromJson(v));
      });
    }
    var time = json['time'];
    var sunRise = json['sun_rise'];
    var sunSet = json['sun_set'];
    var timezoneName = json['timezone_name'];
    var parent =
        json['parent'] != null ? new Parent.fromJson(json['parent']) : null;

    var sources = new List<Sources>();
    if (json['sources'] != null) {
      json['sources'].forEach((v) {
        sources.add(Sources.fromJson(v));
      });
    }
    var title = json['title'];
    var locationType = json['location_type'];
    var woeid = json['woeid'];
    var lattLong = json['latt_long'];
    var timezone = json['timezone'];

    return MetaWeatherModel(
      title: title,
      consolidatedWeather: consolidatedWeather,
      lattLong: lattLong,
      locationType: locationType,
      parent: parent,
      sources: sources,
      sunRise: sunRise,
      sunSet: sunSet,
      time: time,
      timezone: timezone,
      timezoneName: timezoneName,
      woeid: woeid,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.consolidatedWeather != null) {
      data['consolidated_weather'] =
          this.consolidatedWeather.map((v) => v.toJson()).toList();
    }
    data['time'] = this.time;
    data['sun_rise'] = this.sunRise;
    data['sun_set'] = this.sunSet;
    data['timezone_name'] = this.timezoneName;
    if (this.parent != null) {
      data['parent'] = this.parent.toJson();
    }
    if (this.sources != null) {
      data['sources'] = this.sources.map((v) => v.toJson()).toList();
    }
    data['title'] = this.title;
    data['location_type'] = this.locationType;
    data['woeid'] = this.woeid;
    data['latt_long'] = this.lattLong;
    data['timezone'] = this.timezone;
    return data;
  }
}
