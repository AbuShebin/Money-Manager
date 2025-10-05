import 'package:flutter/material.dart';
import 'package:money_management_app/core/common/global_variables.dart';
import 'package:money_management_app/features/accounts/screens/add_account_screen.dart';

class ManageAccounts extends StatelessWidget {
  const ManageAccounts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Manage Accounts"),
        ),
        body: GridView.builder(
          itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: w * 0.4,
              height: h * 0.01,
              color: Colors.amber,
            ),
          ),
          itemCount: 5,
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const AddAccountScreen(),
            ),
          ),
        ));
  }
}
