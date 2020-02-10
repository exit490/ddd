import 'package:equatable/equatable.dart';

class ConsolidatedWeather extends Equatable {
  final int id;
  final String weatherStateName;
  final String weatherStateAbbr;
  final String windDirectionCompass;
  final String created;
  final String applicableDate;
  final double minTemp;
  final double maxTemp;
  final double theTemp;
  final double windSpeed;
  final double windDirection;
  final double airPressure;
  final int humidity;
  final double visibility;
  final int predictability;

  @override
  List<Object> get props => [
        id,
        weatherStateName,
        weatherStateAbbr,
        windDirectionCompass,
        created,
        applicableDate,
        minTemp,
        maxTemp,
        theTemp,
        windSpeed,
        windDirection,
        airPressure,
        humidity,
        visibility,
        predictability,
      ];

  ConsolidatedWeather({
    this.id,
    this.weatherStateName,
    this.weatherStateAbbr,
    this.windDirectionCompass,
    this.created,
    this.applicableDate,
    this.minTemp,
    this.maxTemp,
    this.theTemp,
    this.windSpeed,
    this.windDirection,
    this.airPressure,
    this.humidity,
    this.visibility,
    this.predictability,
  });

  static fromJson(Map<String, dynamic> json) {
    var id = json['id'];
    var weatherStateName = json['weather_state_name'];
    var weatherStateAbbr = json['weather_state_abbr'];
    var windDirectionCompass = json['wind_direction_compass'];
    var created = json['created'];
    var applicableDate = json['applicable_date'];
    var minTemp = json['min_temp'];
    var maxTemp = json['max_temp'];
    var theTemp = json['the_temp'];
    var windSpeed = json['wind_speed'];
    var windDirection = json['wind_direction'];
    var airPressure = json['air_pressure'];
    var humidity = json['humidity'];
    var visibility = json['visibility'];
    var predictability = json['predictability'];

    return ConsolidatedWeather(
      minTemp: minTemp,
      maxTemp: maxTemp,
      applicableDate: applicableDate,
      airPressure: airPressure,
      created: created,
      humidity: humidity,
      id: id,
      predictability: predictability,
      theTemp: theTemp,
      visibility: visibility,
      weatherStateAbbr: weatherStateAbbr,
      windDirection: windDirection,
      weatherStateName: weatherStateName,
      windDirectionCompass: windDirectionCompass,
      windSpeed: windSpeed,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['weather_state_name'] = this.weatherStateName;
    data['weather_state_abbr'] = this.weatherStateAbbr;
    data['wind_direction_compass'] = this.windDirectionCompass;
    data['created'] = this.created;
    data['applicable_date'] = this.applicableDate;
    data['min_temp'] = this.minTemp;
    data['max_temp'] = this.maxTemp;
    data['the_temp'] = this.theTemp;
    data['wind_speed'] = this.windSpeed;
    data['wind_direction'] = this.windDirection;
    data['air_pressure'] = this.airPressure;
    data['humidity'] = this.humidity;
    data['visibility'] = this.visibility;
    data['predictability'] = this.predictability;
    return data;
  }
}
