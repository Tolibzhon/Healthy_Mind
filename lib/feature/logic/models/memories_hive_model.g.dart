// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'memories_hive_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MemoriesHiveModelAdapter extends TypeAdapter<MemoriesHiveModel> {
  @override
  final int typeId = 1;

  @override
  MemoriesHiveModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MemoriesHiveModel(
      id: fields[0] as int,
      title: fields[1] as String,
      event: fields[2] as String,
      emotions: fields[3] as String,
      importantPoints: fields[4] as String,
      conclusion: fields[5] as String,
      image: fields[6] as String,
      date: fields[7] as String,
    );
  }

  @override
  void write(BinaryWriter writer, MemoriesHiveModel obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.event)
      ..writeByte(3)
      ..write(obj.emotions)
      ..writeByte(4)
      ..write(obj.importantPoints)
      ..writeByte(5)
      ..write(obj.conclusion)
      ..writeByte(6)
      ..write(obj.image)
      ..writeByte(7)
      ..write(obj.date);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MemoriesHiveModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
