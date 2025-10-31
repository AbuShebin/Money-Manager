import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:money_management_app/core/common/widgets/custom_elevated_button.dart';
import 'package:money_management_app/core/common/widgets/custom_textformfield.dart';
import 'package:money_management_app/core/theme/theme.dart';
import 'package:money_management_app/db/account/account_db.dart';
import 'package:money_management_app/model/accounts/accounts_model.dart';

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
          AccountDB accountsDB = AccountDB();
          AccountsModel data = AccountsModel(
              id: DateTime.now().microsecondsSinceEpoch.toString(),
              name: accountNameController.text,
              balance: 500,
              type: "");
          accountsDB.addAccount(data: data);
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
