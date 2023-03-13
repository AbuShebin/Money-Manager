// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Home_Card_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HomeCardModelAdapter extends TypeAdapter<HomeCardModel> {
  @override
  final int typeId = 1;

  @override
  HomeCardModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HomeCardModel(
      totalbalance: fields[0] as double,
      totalIncome: fields[1] as double?,
      totalExpense: fields[2] as double?,
      id: fields[3] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, HomeCardModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.totalbalance)
      ..writeByte(1)
      ..write(obj.totalIncome)
      ..writeByte(2)
      ..write(obj.totalExpense);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HomeCardModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
