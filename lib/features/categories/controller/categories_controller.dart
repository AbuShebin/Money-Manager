import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:money_management_app/features/categories/repository/categories_repository.dart';
import 'package:money_management_app/model/category/category_model.dart';

final categoryControllerProvider = NotifierProvider<CategoriesController,bool>(
  () => CategoriesController(),
);

class CategoriesController extends Notifier<bool> {
  Future<List<CategoryModel>> getAllCategories() {
   return ref.read(categoryRepositoryProvider).getAllCategories();
  }

  @override
  bool build() {
    return false;
  }
}
