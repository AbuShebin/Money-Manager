
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:money_management_app/db/budget/budget_db.dart';
import 'package:money_management_app/screens/budget/manage_budget.dart';
import '../../db/category/categor_db.dart';
import '../../model/category/category_model.dart';

class ScreenBudget extends StatefulWidget {
  const ScreenBudget({Key? key}) : super(key: key);

  @override
  State<ScreenBudget> createState() => _ScreenBudgetState();
}

class _ScreenBudgetState extends State<ScreenBudget> {

  @override
  Widget build(BuildContext context) {
    BudgetDB.instance.refreshlimit;
    return ValueListenableBuilder(
      valueListenable: CategoryDB().expenseCategoryListlistener,
      builder: (BuildContext ctx, List<CategoryModel> newlist, Widget? _) {
        final _budgeteditingcontroller = TextEditingController();
        return 
         Column(
           children: [
            ElevatedButton(onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (ctx){
                return Manage_Budget();
              }));
            }, child: Text('Manage Budget')),
             Expanded(
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
                                  children:const [
                                    Text("spend:xxx"),
                                   ],),
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
             ),
           ],
         );

            
        
      },
      
    );
  }
}
