import 'package:flutter/cupertino.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:money_management_app/model/category/category_model.dart';

const CATEGORY_DB_NAME = 'nameofcategorydb';

abstract class CategoryDB_functions {
  Future<List<CategoryModel>> getcategory();
  Future<void> insertCategory(CategoryModel value);
  Future<void> deleteCategory(String categoryID);
}

class CategoryDB implements CategoryDB_functions {
  CategoryDB._internal();
  static CategoryDB instance = CategoryDB._internal();
  factory CategoryDB() {
    return instance;
  }
  ValueNotifier<List<CategoryModel>> incomeCategoryListlistener =
      ValueNotifier([]);
  ValueNotifier<List<CategoryModel>> expenseCategoryListlistener =
      ValueNotifier([]);

  @override
  Future<void> insertCategory(CategoryModel value) async {
    print("insert category triggered $value");
    final _categorydb = await Hive.openBox<CategoryModel>(CATEGORY_DB_NAME);
    await _categorydb.put(value.id, value);
    print("category db after insertion $_categorydb");
    refreshUI();
  }

  @override
  Future<List<CategoryModel>> getcategory() async {
    final _categorydb = await Hive.openBox<CategoryModel>(CATEGORY_DB_NAME);
    return _categorydb.values.toList();
  }

  refreshUI() async {
    final _allCategories = await getcategory();
    incomeCategoryListlistener.value.clear();
    expenseCategoryListlistener.value.clear();
    Future.forEach(
      _allCategories,
      (CategoryModel category) {
        if (category.type == CategoryType.income) {
          incomeCategoryListlistener.value.add(category);
        } else {
          expenseCategoryListlistener.value.add(category);
        }
      },
    );
    incomeCategoryListlistener.notifyListeners();
    expenseCategoryListlistener.notifyListeners();
  }

  @override
  Future<void> deleteCategory(String categoryID) async {
    final _deletebox = await Hive.openBox<CategoryModel>(CATEGORY_DB_NAME);
    await _deletebox.delete(categoryID);
    refreshUI();
  }
}
