// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'budget_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SpendModelAdapter extends TypeAdapter<SpendModel> {
  @override
  final int typeId = 4;

  @override
  SpendModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SpendModel(
      id: fields[0] as String,
      spend: fields[1] as double,
      type: fields[2] as CategoryType,
    );
  }

  @override
  void write(BinaryWriter writer, SpendModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.spend)
      ..writeByte(2)
      ..write(obj.type);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SpendModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class LimitModelAdapter extends TypeAdapter<LimitModel> {
  @override
  final int typeId = 5;

  @override
  LimitModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LimitModel(
      limit: fields[1] as double,
    )..id = fields[0] as String?;
  }

  @override
  void write(BinaryWriter writer, LimitModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.limit);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LimitModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
