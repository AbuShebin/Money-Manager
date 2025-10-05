import 'package:hive_flutter/adapters.dart';

enum CategoryType {
  income,
  expense,
}

class CategoryModel {
  final String id;
  final String name;
  final bool isDeleted;
  final CategoryType type;
  final String? parentId;

  CategoryModel({
    required this.id,
    required this.name,
    required this.type,
    required this.parentId,
    this.isDeleted = false,
  });
  @override
  String toString() {
    return '{$name $type}';
  }
}
