import 'package:flutter/material.dart';
import 'package:money_management_app/db/budget/budget_db.dart';
import '../../db/category/categor_db.dart';
import '../../model/category/category_model.dart';

class Manage_Budget extends StatefulWidget {
  const Manage_Budget({Key? key}) : super(key: key);

  @override
  State<Manage_Budget> createState() => _ScreenBudgetState();
}

class _ScreenBudgetState extends State<Manage_Budget> {
  @override
  Widget build(BuildContext context) {
    BudgetDB.instance.refreshlimit;
    return ValueListenableBuilder(
      valueListenable: CategoryDB().expenseCategoryListlistener,
      builder: (BuildContext ctx, List<CategoryModel> newlist, Widget? _) {
        final _budgeteditingcontroller = TextEditingController();
        return Expanded(
          child: ListView.separated(
            itemBuilder: (ctx, index) {
              final _category = newlist[index];

              return ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 5,
                    ),
                    Card(
                      elevation: 8,
                      child: ListTile(
                        tileColor: Colors.grey.shade200,
                        title: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(_category.name),
                        ),
                        subtitle: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text("spend:xxx"),
                          ],
                        ),
                        trailing: ElevatedButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (ctx) {
                                return AlertDialog(
                                  title: const Text("Set limit"),
                                  content: TextFormField(
                                    controller: _budgeteditingcontroller,
                                    decoration: const InputDecoration(
                                      border: OutlineInputBorder(),
                                      hintText: 'Set Budget',
                                    ),
                                  ),
                                  actions: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        TextButton(
                                          onPressed: () {
                                            Navigator.of(ctx).pop();
                                          },
                                          child: const Text("cancel"),
                                        ),
                                        TextButton(
                                          onPressed: () async {
                                            final _limittext =
                                                _budgeteditingcontroller.text;
                                            if (_limittext.isEmpty) {
                                              return;
                                            }
                                            final _parsedlimit =
                                                double.tryParse(_limittext);
                                            if (_parsedlimit == null) {
                                              return;
                                            }

                                            Navigator.of(context).pop();
                                          },
                                          child: const Text("save"),
                                        ),
                                      ],
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                          child: const Text("SET LIMIT"),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
            separatorBuilder: (ctx, index) {
              return const SizedBox(
                height: 5,
              );
            },
            itemCount: newlist.length,
          ),
        );
      },
    );
  }
}
