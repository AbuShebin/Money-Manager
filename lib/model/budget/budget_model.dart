import 'package:hive_flutter/hive_flutter.dart';
import 'package:money_management_app/model/category/category_model.dart';


class SpendModel {
  final String id;
  final double spend;
  final CategoryType type;

//constructor
  SpendModel( {
   required this.id,
   required this.spend,
   required this.type,
   }
   );

}

class LimitModel{
   String? id;
  final double limit;


//constructor
  LimitModel({required this.limit,}){
    id=DateTime.now().millisecondsSinceEpoch.toString();
  }
}