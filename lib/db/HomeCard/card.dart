//   import 'package:hive_flutter/hive_flutter.dart';
// import 'package:money_management_app/model/transaction/transaction_model.dart';

// int totals = 0;
// Hive.openBox<TransactionModel>('data');
// final box = Hive.box<TransactionModel>('data');

// int total() {
//   var history2 = box.values.toList();
//   List a = [0, 0];
//   for (var i = 0; i < history2.length; i++) {
//     a.add(history2[i].id == 'Income'
//         ? int.parse(history2[i].amount.toString())
//         : int.parse(history2[i].amount.toString()) * -1);
//   }
//   totals = a.reduce((value, element) => value + element);
//   return totals;
// }