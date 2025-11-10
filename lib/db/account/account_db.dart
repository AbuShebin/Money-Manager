import 'package:flutter/widgets.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:money_management_app/model/accounts/accounts_model.dart';

abstract class AccountDBFunctions {
  Future<void> addAccount({required AccountsModel data});
  Future<List<AccountsModel>> getAllAccounts();
  Future<void> updateAccount({required AccountsModel data});
}

class AccountDB implements AccountDBFunctions {
  AccountDB._internal();

  static AccountDB instance = AccountDB._internal();

  factory AccountDB() {
    return instance;
  }

  ValueNotifier<List<AccountsModel>> accountsListnotifier = ValueNotifier([]);

  @override
  Future<bool> addAccount({required AccountsModel data}) async {
    final accountDb = await Hive.openBox<AccountsModel>("accounts_db");

    await accountDb.put(data.id, data);

    print("✅ Account Inserted: ID = ${accountDb.values}");

    await refresh(); // Refresh notifier to update UI

    return true;
  }

  // @override
  // Future<List<AccountsModel>> getAllAccountsList() async {
  //   final _db = await Hive.openBox<AccountsModel>("accounts_db");
  //   return _db.values.toList();
  // }

  Future<void> refresh() async {
    final _list = await getAllAccounts();
    accountsListnotifier.value.clear();
    accountsListnotifier.value.addAll(_list);
    accountsListnotifier.notifyListeners();
  }

  @override
  Future<List<AccountsModel>> getAllAccounts() async {
    final _db = await Hive.openBox<AccountsModel>("accounts_db");
    print("📦 Current accounts in DB: ${_db.values.toList()}");
    _db.toMap().forEach((key, value) {
      print('📝 Key: $key, Value: $value');
    });

    return _db.values.toList();
  }

  @override
  Future<void> updateAccount({required AccountsModel data}) async {
    final _db = await Hive.openBox<AccountsModel>("accounts_db");
    if(_db.containsKey(data.id)){
      _db.putAt(int.parse(data.id), data);
      refresh();
    }

  }
}
