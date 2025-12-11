import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:money_management_app/core/theme/theme_provider.dart';
import 'package:money_management_app/features/accounts/screens/accounts_screen.dart';
import 'package:money_management_app/features/categories/screens/manage_categories.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Settings"),
          actions: [
            Consumer(
                builder: (context, ref, child) => IconButton(
                      icon: const Icon(Icons.dark_mode),
                      onPressed: () =>
                          ref.read(themeProvider.notifier).toggleTheme(),
                    )),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 8.0, right: 8),
          child: Column(
            spacing: 2,
            children: [
              ListTile(
                title: const Text("Accounts"),
                trailing: const Icon(Icons.chevron_right),
                onTap: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const ManageAccounts(),
                )),
              ),
              ListTile(
                title: const Text("Manage categories"),
                trailing: const Icon(Icons.chevron_right),
                onTap: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const ManageCategoriesScreen(),
                )),
              )
            ],
          ),
        ));
  }
}
