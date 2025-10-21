// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'accounts_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AccountsModelAdapter extends TypeAdapter<AccountsModel> {
  @override
  final int typeId = 7;

  @override
  AccountsModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AccountsModel(
      id: fields[0] as String,
      name: fields[1] as String,
      balance: fields[2] as double,
      type: fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, AccountsModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.balance)
      ..writeByte(3)
      ..write(obj.type);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AccountsModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
