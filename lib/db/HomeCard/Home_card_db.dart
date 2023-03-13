import 'package:flutter/cupertino.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:money_management_app/model/HomeCard/Home_Card_model.dart';

abstract class HomeCardFunctions {
  Future<List<HomeCardModel>> getCard();
  Future<void> insertCard(HomeCardModel value);
  
}

class HomeCardDB implements HomeCardFunctions {

  HomeCardDB._internal();
  static HomeCardDB instance = HomeCardDB._internal();
  factory HomeCardDB() {
    return instance;
  }

  ValueNotifier<List<HomeCardModel>> HomecardListener =
      ValueNotifier([]);

  @override
  Future<void> insertCard(HomeCardModel value) async {
    final _homeCarddb = await Hive.openBox<HomeCardModel>('nameofHomeCardDB');
    _homeCarddb.put(value.id, value);
    refreshUI();
  }

  @override
  Future<List<HomeCardModel>> getCard() async {
    final _homeCarddb = await Hive.openBox<HomeCardModel>('nameofHomeCardDB');
    return _homeCarddb.values.toList();
  }

  refreshUI() async {
    final _allhomecard =await getCard();
    HomecardListener.value.clear();
    HomecardListener.value.addAll(_allhomecard);
    HomecardListener.notifyListeners();

  }
}
