import 'package:flutter/material.dart';
import 'package:money_management_app/core/theme/app_theme.dart';

import '../../db/category/categor_db.dart';
import '../../model/category/category_model.dart';

class Incomecategory extends StatelessWidget {
  const Incomecategory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: CategoryDB().incomeCategoryListlistener,
        builder: (BuildContext ctx, List<CategoryModel> newlist, Widget? _) {
          return ListView.builder(
            itemBuilder: (ctx, index) {
              final category = newlist[index];
              return Padding(
                padding: const EdgeInsets.only(left: 8.0,right: 8,top: 4),
                child: Card(
                  child: ListTile(
                    tileColor: Palette.popWhite300,
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
