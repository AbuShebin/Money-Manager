import 'package:flutter/material.dart';
import 'package:money_management_app/home/widgets/bottom_navigation.dart';
import 'package:money_management_app/screens/budget/screen_budget.dart';
import 'package:money_management_app/screens/stats/screen_stats.dart';
import '../screens/more/more.dart';
import '../screens/transactions/Add_transaction.dart';
import '../screens/catagory/popup.dart';
import '../screens/catagory/screen_catagory.dart';
import '../screens/transactions/Screen_transactions.dart';

class Screen_home extends StatelessWidget {
  Screen_home({Key? key}) : super(key: key);
  final _pages = const [
    Screen_transactions(),
    Screen_catagory(),
    ScreenStats(),
  ];
  static ValueNotifier<int> selectedindexnotifier = ValueNotifier(0);
  String addtext='Add';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        toolbarHeight: 0,
      ),
      bottomNavigationBar: const bottom_navigation(),
      body: ValueListenableBuilder(
        valueListenable: selectedindexnotifier,
        builder: (BuildContext ctx, int updatedIndex, Widget? _) {
          return _pages[updatedIndex];
        },
      ),
      
      floatingActionButton: FloatingActionButton.extended(
        
        elevation: 30,
        onPressed: () {
          
          if (selectedindexnotifier.value == 0) {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) {
                  return const Add_transaction();
                },
              ),
            );
          } else {
            popup_category(context);
            addtext='Add Category';
          }
          
        },
        label: Text(addtext),
        icon: Icon(Icons.add),
        
        
      ),
    );
  }
}
