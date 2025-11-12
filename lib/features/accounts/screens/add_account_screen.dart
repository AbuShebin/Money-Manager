import 'package:flutter/material.dart';
import 'package:money_management_app/core/common/widgets/customDropdown_common.dart';
import 'package:money_management_app/core/common/widgets/custom_elevated_button.dart';
import 'package:money_management_app/core/common/widgets/custom_textformfield.dart';
import 'package:money_management_app/core/theme/app_theme.dart';
import 'package:money_management_app/core/utilities/custom_snackBar.dart';
import 'package:money_management_app/db/account/account_db.dart';
import 'package:money_management_app/model/accounts/accounts_model.dart';

class AddAccountScreen extends StatelessWidget {
  AddAccountScreen({Key? key}) : super(key: key);

  TextEditingController accountNameController = TextEditingController();
  TextEditingController initialBalance = TextEditingController(text: "0");

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
          CustomTextformfield(
            hintTextCustom: "eg: 1000",
            labelTextCustom: "Initial balance (optional)",
            titleCOntroller: initialBalance,
          ),
        ],
      ),
      floatingActionButton: CustomElevatedButton(
        onPressed: () {
          addAccount(context: context);
        },
        text: "Save",
        backgroundColor: Palette.primary,
        textColor: Colors.white,
        width: w,
        height: h * 0.07,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  addAccount({required BuildContext context}) async {
    if(accountNameController.text.isEmpty){
      return showSnackBar(content: "Account name is not provided", context: context, color: Palette.error);
    }
    AccountDB accountsDB = AccountDB();
    AccountsModel data = AccountsModel(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        name: accountNameController.text,
        balance: initialBalance.text,
        type: "To be added while creating");
    final result = await accountsDB.addAccount(data: data);

    if (result == true) {
      Navigator.of(context).pop();
    }
  }
}
