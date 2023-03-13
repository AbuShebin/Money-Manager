import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:money_management_app/screens/transactions/Screen_transactions.dart';

// class PieData {
//  static List<Data> data = [
//     Data(name: 'Expense', percentage: expensepercentage.round().toDouble(), color: Colors.red),
//     Data(name: 'income', percentage: incomepercentage.round().toDouble(), color: Colors.green),
//   ];
// }
class PieData {
 static List<Data> data = [
    Data(name: 'Expense', percentage: 60, color: Colors.red),
    Data(name: 'income', percentage: 40, color: Colors.green),
  ];
}

class Data {
  final String name;
  final double percentage;
  final Color color;

  Data({
    required this.name,
    required this.percentage,
    required this.color,
  });
}
