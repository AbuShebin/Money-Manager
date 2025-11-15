import 'package:flutter_riverpod/legacy.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:money_management_app/model/category/category_model.dart';

final categoryRepositoryProvider = StateProvider(
  (ref) {
    return CategoriesRepositoryImpl();
  },
);

abstract class CategoriesRepository {
  Future<List<CategoryModel>> getAllCategories();
}

class CategoriesRepositoryImpl implements CategoriesRepository {
  @override
  Future<List<CategoryModel>> getAllCategories() async {
    final _db = await Hive.openBox<CategoryModel>("nameofcategorydb");

    return _db.values.toList();
  }
}
