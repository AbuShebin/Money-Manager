import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:money_management_app/home/Screen_home.dart';
import 'package:money_management_app/model/accounts/accounts_model.dart';
import 'package:money_management_app/model/category/category_model.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        insertDefaultCategories();
        insertDefaultAccounts();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Money manager"),
      ),
    );
  }

  insertDefaultCategories() async {
    final _db = await Hive.openBox<CategoryModel>("nameofcategorydb");
    if (_db.isEmpty) {
      //setting up data to insert.
      final List<CategoryModel> incomeCategory = [
        CategoryModel(
            id: DateTime.now().microsecondsSinceEpoch.toString(),
            name: "Salary",
            type: CategoryType.income),
        CategoryModel(
            id: DateTime.now().microsecondsSinceEpoch.toString(),
            name: "Divident",
            type: CategoryType.income),
        CategoryModel(
            id: DateTime.now().microsecondsSinceEpoch.toString(),
            name: "Others",
            type: CategoryType.income),
        CategoryModel(
            id: DateTime.now().microsecondsSinceEpoch.toString(),
            name: "Food",
            type: CategoryType.expense),
        CategoryModel(
            id: DateTime.now().microsecondsSinceEpoch.toString(),
            name: "Transportation",
            type: CategoryType.expense),
        CategoryModel(
            id: DateTime.now().microsecondsSinceEpoch.toString(),
            name: "Fuel",
            type: CategoryType.expense),
        CategoryModel(
            id: DateTime.now().microsecondsSinceEpoch.toString(),
            name: "Health",
            type: CategoryType.expense),
        CategoryModel(
            id: DateTime.now().microsecondsSinceEpoch.toString(),
            name: "Shopping",
            type: CategoryType.expense),
        CategoryModel(
            id: DateTime.now().microsecondsSinceEpoch.toString(),
            name: "Bills",
            type: CategoryType.expense),
        CategoryModel(
            id: DateTime.now().microsecondsSinceEpoch.toString(),
            name: "Entertainment",
            type: CategoryType.expense),
        CategoryModel(
            id: DateTime.now().microsecondsSinceEpoch.toString(),
            name: "Cloths",
            type: CategoryType.expense),
        CategoryModel(
            id: DateTime.now().microsecondsSinceEpoch.toString(),
            name: "Personal care",
            type: CategoryType.expense),
        CategoryModel(
            id: DateTime.now().microsecondsSinceEpoch.toString(),
            name: "Subscriptions",
            type: CategoryType.expense),
        CategoryModel(
            id: DateTime.now().microsecondsSinceEpoch.toString(),
            name: "Others",
            type: CategoryType.expense),
      ];
      await _db.addAll(incomeCategory);
    }
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(
        builder: (context) => Screenhome(),
      ),
      (route) => false,
    );
  }

  insertDefaultAccounts() async {
    final _db = await Hive.openBox<AccountsModel>("accounts_db");
    if(_db.isEmpty){
       ///arranging account data
    final List<AccountsModel> accountData = [
      AccountsModel(
          id: DateTime.now().millisecondsSinceEpoch.toString(),
          name: "Cash",
          balance: "0",
          type: ""),
      AccountsModel(
          id: DateTime.now().millisecondsSinceEpoch.toString(),
          name: "Savings account",
          balance: "0",
          type: ""),
    ];

    _db.addAll(accountData);
    }

   
  }
}
