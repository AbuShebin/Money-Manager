import 'package:flutter/material.dart';
import 'package:money_management_app/core/common/global_variables.dart';
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
    return Scaffold(
      appBar: AppBar(title: const Text("Manage Accounts")),
      body: ValueListenableBuilder(
        valueListenable: AccountDB.instance.accountsListnotifier,
        builder: (context, List<AccountsModel> data, child) {
          print("accounts data $data");

          return data.isEmpty
              ? Center(child: const Text("No accounts data"))
              : GridView.builder(
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.4,
                      height: MediaQuery.of(context).size.height * 0.01,
                      color: Colors.amber,
                      child: Center(
                        child: Text(data[index].name), // Example display
                      ),
                    ),
                  ),
                  itemCount: data.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
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
