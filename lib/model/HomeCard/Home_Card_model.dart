

import 'package:hive_flutter/hive_flutter.dart';

class HomeCardModel {
  final double totalbalance;
  final double? totalIncome;
  final double? totalExpense;
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
