import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:money_management_app/features/categories/controller/categories_controller.dart';
import 'package:money_management_app/model/category/category_model.dart';

final categoriesAsyncNotifierProvider =
    AsyncNotifierProvider<CategoriesProvider, List<CategoryModel>>(
  () => CategoriesProvider(),
);

class CategoriesProvider extends AsyncNotifier<List<CategoryModel>> {
 Future<List<CategoryModel>> getAllCategories() {
  return  ref.read(categoryControllerProvider.notifier).getAllCategories();
  }

  @override
  FutureOr<List<CategoryModel>> build() {
    return getAllCategories();
  }
}
