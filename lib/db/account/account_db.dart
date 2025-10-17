import 'package:flutter/widgets.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:money_management_app/model/accounts/accounts_model.dart';

abstract class AccountDBFunctions {
  Future<void> addAccount({required AccountsModel data});
  Future<List<AccountsModel>> getAllAccountsList();
}

class AccountDB implements AccountDBFunctions {
  AccountDB._internal();

  static AccountDB instance = AccountDB._internal();

  factory AccountDB() {
    return instance;
  }

  ValueNotifier<List<AccountsModel>> transactionListnotifier = ValueNotifier([]);

  @override
  Future<void> addAccount({required AccountsModel data}) async {
    final accountDb = await Hive.openBox("accounts_db");
    await accountDb.put(data.id, data);
  }
  
  @override
  Future<List<AccountsModel>> getAllAccountsList() async{
    final _limitdb = await Hive.openBox<AccountsModel>("accounts_db");
    return _limitdb.values.toList();
  }




}
