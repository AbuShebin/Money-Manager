// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'package:hive_flutter/hive_flutter.dart';

part 'accounts_model.g.dart';

@HiveType(typeId: 7)
class AccountsModel {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final double balance;
  @HiveField(3)
  final String type;

  AccountsModel(
      {required this.id,
      required this.name,
      required this.balance,
      required this.type});

  AccountsModel copyWith({
    String? id,
    String? name,
    double? balance,
    String? type,
  }) {
    return AccountsModel(
      id: id ?? this.id,
      name: name ?? this.name,
      balance: balance ?? this.balance,
      type: type ?? this.type,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'balance': balance,
      'type': type,
    };
  }

  factory AccountsModel.fromMap(Map<String, dynamic> map) {
    return AccountsModel(
      id: map['id'] as String,
      name: map['name'] as String,
      balance: map['balance'] as double,
      type: map['type'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory AccountsModel.fromJson(String source) =>
      AccountsModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'AccountsModel(id: $id, name: $name, balance: $balance, type: $type)';
  }

  @override
  bool operator ==(covariant AccountsModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.balance == balance &&
        other.type == type;
  }

  @override
  int get hashCode {
    return id.hashCode ^ name.hashCode ^ balance.hashCode ^ type.hashCode;
  }
}
