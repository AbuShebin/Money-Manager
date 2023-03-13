

import 'package:hive_flutter/hive_flutter.dart';
part 'Home_Card_model.g.dart';

@HiveType(typeId: 1)
class HomeCardModel {
  @HiveField(0)
  final double totalbalance;
  @HiveField(1)
  final double? totalIncome;
  @HiveField(2)
  final double? totalExpense;
  @HiveField(3)
  final String? id;

  HomeCardModel(
      {required this.totalbalance,
      required this.totalIncome,
      required this.totalExpense,
      required this.id});

      @override
  String toString() {
    
    return '$totalbalance';
  }
}
