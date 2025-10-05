import 'package:money_management_app/model/category/category_model.dart';

class TransactionModel {
  final String purpose;
  final double amount;
  final DateTime date;
  final CategoryType type;
  final CategoryModel category;
  String? id;
  final String account_id;

  TransactionModel({
    required this.purpose,
    required this.amount,
    required this.date,
    required this.type,
    required this.category,
    required this.account_id
  }) {
    id = DateTime.now().millisecondsSinceEpoch.toString();
  }
}
