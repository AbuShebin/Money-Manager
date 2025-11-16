import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:money_management_app/features/categories/provider/categories_provider.dart';

class ManageCategoriesScreen extends StatelessWidget {
  const ManageCategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Consumer(
        builder: (context, ref, child) {
          return ref.watch(categoriesAsyncNotifierProvider).when(
                data: (data) => ListView.builder(
                  itemBuilder: (context, index) {
                    return data.isEmpty
                        ? const Center(
                            child: Text("No categories"),
                          )
                        : ListTile(title: Text(data[index].name));
                  },
                  itemCount: data.length,
                ),
                error: (error, stackTrace) =>
                    Center(child: Text(error.toString())),
                loading: () => const CircleAvatar(),
              );
        },
      ),
    );
  }
}
