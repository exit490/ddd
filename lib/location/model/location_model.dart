import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

@HiveType(typeId: 0)
class LocationModel extends Equatable {
  @HiveField(0)
  final String title;

  @HiveField(1)
  final String locationType;

  @HiveField(2)
  final int woeid;

  @HiveField(3)
  final String latLong;

  LocationModel({
    this.title,
    this.locationType,
    this.woeid,
    this.latLong,
  });

  static LocationModel fromJson(dynamic json) {
    return LocationModel(
      title: json['title'],
      locationType: json['location_type'],
      woeid: json['woeid'],
      latLong: json['latt_long'],
    );
  }

  @override
  List<Object> get props => [
        title,
        locationType,
        woeid,
        latLong,
      ];
}
