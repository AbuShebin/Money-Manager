import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:money_management_app/core/common/widgets/custom_elevated_button.dart';
import 'package:money_management_app/core/common/widgets/custom_textformfield.dart';
import 'package:money_management_app/core/theme/theme.dart';

class AddAccountScreen extends StatelessWidget {
  AddAccountScreen({Key? key}) : super(key: key);

  TextEditingController accountNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final double h = MediaQuery.of(context).size.height;
    final double w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add account"),
      ),
      body: Column(
        children: [
          CustomTextformfield(
            hintTextCustom: "eg: SBI",
            labelTextCustom: "Account name",
            titleCOntroller: accountNameController,
          ),
        ],
      ),
      floatingActionButton: CustomElevatedButton(
        onPressed: () async {
          final accounts_db = await Hive.openBox("accounts");
          accounts_db.put("key", accountNameController.text);

          print("account added ${accounts_db.toMap()}");
        },
        text: "Save",
        backgroundColor: Palette.primaryColor,
        textColor: Colors.white,
        width: w,
        height: h * 0.07,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
