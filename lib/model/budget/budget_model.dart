import 'package:hive_flutter/hive_flutter.dart';
import 'package:money_management_app/model/category/category_model.dart';
part 'budget_model.g.dart';

@HiveType(typeId: 4)

class SpendModel {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final double spend;
  @HiveField(2)
  final CategoryType type;

//constructor
  SpendModel( {
   required this.id,
   required this.spend,
   required this.type,
   }
   );

}
@HiveType(typeId: 5)

class LimitModel{
  @HiveField(0)
   String? id;
  @HiveField(1)
  final double limit;


//constructor
  LimitModel({required this.limit,}){
    id=DateTime.now().millisecondsSinceEpoch.toString();
  }
}