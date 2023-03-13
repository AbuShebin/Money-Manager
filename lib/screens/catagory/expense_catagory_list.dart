import 'package:flutter/material.dart';
import 'package:money_management_app/db/category/categor_db.dart';
import 'package:money_management_app/model/category/category_model.dart';

class Expensecategorylist extends StatelessWidget {
  const Expensecategorylist({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: CategoryDB().expenseCategoryListlistener,
        builder: (BuildContext ctx, List<CategoryModel> newlist, Widget? _) {
          return ListView.separated(
            itemBuilder: (ctx, index) {
              final category = newlist[index];
              return Card(
                elevation: 8,
                child: ListTile(
                  tileColor: Colors.grey.shade200,
                  title: Text(category.name),
                  trailing: IconButton(
                    onPressed: () {
                      CategoryDB.instance.deleteCategory(category.id);
                    },
                    icon:const Icon(Icons.delete),
                  ),
                ),
              );
            },
            separatorBuilder: (ctx, index) {
              return const SizedBox(
                height: 20,
              );
            },
            itemCount: newlist.length,
          );
        });
  }
}
