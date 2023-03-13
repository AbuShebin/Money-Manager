import 'package:flutter/material.dart';
import 'package:money_management_app/db/category/categor_db.dart';
import 'package:money_management_app/screens/catagory/expense_catagory_list.dart';
import 'income_catogary_list.dart';

class Screen_catagory extends StatefulWidget {
  const Screen_catagory({Key? key}) : super(key: key);

  @override
  State<Screen_catagory> createState() => _Screen_catagoryState();
}

class _Screen_catagoryState extends State<Screen_catagory>
    with SingleTickerProviderStateMixin {
  late TabController _tabcontroller;
  @override
  void initState() {
    _tabcontroller = TabController(length: 2, vsync: this);
    CategoryDB().refreshUI();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: SafeArea(
        child: Column(
          children: [
            TabBar(
              labelColor: Colors.deepPurple,
              unselectedLabelColor: Colors.black,
              controller: _tabcontroller,
              tabs:const [
                Tab(
                  text: 'INCOME',
                ),
                Tab(
                  text: 'EXPENSE',
                ),
              ],
            ),
            Expanded(
              child: TabBarView(
                controller: _tabcontroller,
                children: const[
                  Incomecategory(),
                  Expensecategorylist(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
