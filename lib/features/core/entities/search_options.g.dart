// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_options.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SearchOptionsAdapter extends TypeAdapter<SearchOptions> {
  @override
  final int typeId = 3;

  @override
  SearchOptions read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SearchOptions(
      age: fields[0] as int,
      gender: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, SearchOptions obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.age)
      ..writeByte(1)
      ..write(obj.gender);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SearchOptionsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
