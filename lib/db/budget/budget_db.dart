

import 'package:flutter/cupertino.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../model/budget/budget_model.dart';

const budgetdbname='budget-database';

abstract class BudgetDBFunctions{
  Future<List<LimitModel>>getlimit();
  Future<void> insertlimit(LimitModel spendModel);
}


class BudgetDB implements BudgetDBFunctions{

 BudgetDB._internal();

static BudgetDB instance=BudgetDB._internal();
factory BudgetDB(){
  return instance;
}

ValueNotifier <List<LimitModel>> limitnotifier=ValueNotifier([]);

  @override
  Future<void> insertlimit(LimitModel spendModel) async{
    final _limitdb=await Hive.openBox<LimitModel>(budgetdbname);
   await _limitdb.put(spendModel.id, spendModel);
  }

  Future<void>refreshlimit()async{
    final _limitlist=await getlimit();
    limitnotifier.value.clear();
    limitnotifier.value.addAll(_limitlist);
  }
  
  @override
  Future<List<LimitModel>> getlimit() async{
    final _limitdb=await Hive.openBox<LimitModel>(budgetdbname);
    return _limitdb.values.toList();
  }

}