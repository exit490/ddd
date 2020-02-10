// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LocationModelAdapter extends TypeAdapter<LocationModel> {
  @override
  final typeId = 0;

  @override
  LocationModel read(BinaryReader reader) {
    var numOfFields = reader.readByte();
    var fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LocationModel(
      title: fields[0] as String,
      locationType: fields[1] as String,
      woeid: fields[2] as int,
      latLong: fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, LocationModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.locationType)
      ..writeByte(2)
      ..write(obj.woeid)
      ..writeByte(3)
      ..write(obj.latLong);
  }
}
