class ConsolidatedWeather {
  int id;
  String weatherStateName;
  String weatherStateAbbr;
  String windDirectionCompass;
  String created;
  String applicableDate;
  double minTemp;
  double maxTemp;
  double theTemp;
  double windSpeed;
  double windDirection;
  double airPressure;
  int humidity;
  double visibility;
  int predictability;

  ConsolidatedWeather(
      {this.id,
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
      this.predictability});

  ConsolidatedWeather.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    weatherStateName = json['weather_state_name'];
    weatherStateAbbr = json['weather_state_abbr'];
    windDirectionCompass = json['wind_direction_compass'];
    created = json['created'];
    applicableDate = json['applicable_date'];
    minTemp = json['min_temp'];
    maxTemp = json['max_temp'];
    theTemp = json['the_temp'];
    windSpeed = json['wind_speed'];
    windDirection = json['wind_direction'];
    airPressure = json['air_pressure'];
    humidity = json['humidity'];
    visibility = json['visibility'];
    predictability = json['predictability'];
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
