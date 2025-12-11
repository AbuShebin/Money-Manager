import 'package:flutter/material.dart';
import 'package:money_management_app/core/theme/app_pallette.dart';
import 'package:money_management_app/core/theme/app_theme.dart';
import 'package:money_management_app/db/category/categor_db.dart';
import 'package:money_management_app/model/category/category_model.dart';

class Expensecategorylist extends StatelessWidget {
  const Expensecategorylist({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: CategoryDB().expenseCategoryListlistener,
        builder: (BuildContext ctx, List<CategoryModel> newlist, Widget? _) {
          return ListView.builder(
            itemBuilder: (ctx, index) {
              final category = newlist[index];
              return Padding(
                padding: const EdgeInsets.only(left: 8.0,right: 8,top: 4),
                child: Card(
                  child: ListTile(
                    title: Text(category.name),
                    trailing: IconButton(
                      onPressed: () {
                        CategoryDB.instance.deleteCategory(category.id);
                      },
                      icon:const Icon(Icons.delete),
                    ),
                  ),
                ),
              );
            },
            itemCount: newlist.length,
          );
        });
  }
}
