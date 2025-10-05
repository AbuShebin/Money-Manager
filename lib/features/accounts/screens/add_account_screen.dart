import 'package:flutter/material.dart';
import 'package:money_management_app/core/common/widgets/custom_textformfield.dart';

class AddAccountScreen extends StatelessWidget {
  const AddAccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add account"),
      ),
      body: Column(
        children: [
          CustomTextformfield(
              hintTextCustom: "eg: SBI", labelTextCustom: "Account name"),
        ],
      ),
    );
  }
}
