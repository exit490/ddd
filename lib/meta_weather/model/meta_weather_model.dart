import 'consolidate_weather.dart';
import 'parent_model.dart';
import 'sources_model.dart';

class MetaWeatherModel {
  List<ConsolidatedWeather> consolidatedWeather;
  String time;
  String sunRise;
  String sunSet;
  String timezoneName;
  Parent parent;
  List<Sources> sources;
  String title;
  String locationType;
  int woeid;
  String lattLong;
  String timezone;

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

  MetaWeatherModel.fromJson(Map<String, dynamic> json) {
    if (json['consolidated_weather'] != null) {
      consolidatedWeather = new List<ConsolidatedWeather>();
      json['consolidated_weather'].forEach((v) {
        consolidatedWeather.add(new ConsolidatedWeather.fromJson(v));
      });
    }
    time = json['time'];
    sunRise = json['sun_rise'];
    sunSet = json['sun_set'];
    timezoneName = json['timezone_name'];
    parent =
        json['parent'] != null ? new Parent.fromJson(json['parent']) : null;
    if (json['sources'] != null) {
      sources = new List<Sources>();
      json['sources'].forEach((v) {
        sources.add(new Sources.fromJson(v));
      });
    }
    title = json['title'];
    locationType = json['location_type'];
    woeid = json['woeid'];
    lattLong = json['latt_long'];
    timezone = json['timezone'];
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
