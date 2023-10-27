// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hive_datamodel.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SearchwordAdapter extends TypeAdapter<Searchword> {
  @override
  final int typeId = 0;

  @override
  Searchword read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Searchword(
      id: fields[0] as String?,
      englishword: fields[1] as String?,
      malayalam_definition: fields[3] as String?,
      part_of_speech: fields[2] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Searchword obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.englishword)
      ..writeByte(2)
      ..write(obj.part_of_speech)
      ..writeByte(3)
      ..write(obj.malayalam_definition);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SearchwordAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
