import 'package:flutter/material.dart';
import 'package:money_management_app/core/theme/app_theme.dart';
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
      body: SafeArea(
        child: Column(
          children: [
            Container(
              color: Palette.popBlack500,
              child: TabBar(
                labelColor: Palette.popWhite500,
                unselectedLabelColor: Palette.popWhite100,
                indicatorColor: Palette.popWhite500,
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
