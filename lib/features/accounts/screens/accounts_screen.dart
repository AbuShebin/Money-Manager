import 'package:flutter/material.dart';
import 'package:money_management_app/core/constands/constands.dart';
import 'package:money_management_app/core/theme/app_theme.dart';
import 'package:money_management_app/db/account/account_db.dart';
import 'package:money_management_app/features/accounts/screens/add_account_screen.dart';
import 'package:money_management_app/model/accounts/accounts_model.dart';

class ManageAccounts extends StatefulWidget {
  const ManageAccounts({Key? key}) : super(key: key);

  @override
  State<ManageAccounts> createState() => _ManageAccountsState();
}

class _ManageAccountsState extends State<ManageAccounts> {
  @override
  void initState() {
    super.initState();
    AccountDB.instance.refresh();
  }

  @override
  Widget build(BuildContext context) {
    final double h = MediaQuery.of(context).size.height;
    final double w = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(title: const Text("Manage Accounts")),
      body: ValueListenableBuilder(
        valueListenable: AccountDB.instance.accountsListnotifier,
        builder: (context, List<AccountsModel> data, child) {
          print("accounts data in account screen - $data");

          return data.isEmpty
              ? Center(child: const Text("No accounts data"))
              : GridView.builder(
                gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: w * 0.5,
                      height: h * 0.1,
                      decoration: BoxDecoration(
                          color: Palette.popBlack500,
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Center(
                            child: Text(data[index].name,style:const TextStyle(color: Palette.popWhite500),), // Example display
                          ),
                          Text(
                            "${Constands().currency} ${data[index].balance.toString()}",
                            style:const TextStyle(color: Palette.popWhite500),
                          )
                        ],
                      ),
                    ),
                  ),
                  itemCount: data.length,
                );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => AddAccountScreen(),
            ),
          );
          // Refresh again when returning from AddAccountScreen
          AccountDB.instance.refresh();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
