import 'package:hive/hive.dart';

part 'location_model.g.dart';

@HiveType(typeId: 0)
class LocationModel {
  @HiveField(0)
  String title;

  @HiveField(1)
  String locationType;

  @HiveField(2)
  int woeid;

  @HiveField(3)
  String latLong;

  LocationModel(
    this.title,
    this.locationType,
    this.woeid,
    this.latLong,
  );
}
