import 'package:flutter/material.dart';
import 'package:money_management_app/features/accounts/screens/manage_accounts.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Settings"),
        ),
        body: Column(
          children: [
            ListTile(
              title: Text("Accounts"),
              trailing: Icon(Icons.chevron_right),
              onTap: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) =>const ManageAccounts(),
              )),
            )
          ],
        ));
  }
}
