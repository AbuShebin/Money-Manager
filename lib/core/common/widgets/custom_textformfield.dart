import 'package:flutter/material.dart';
import 'package:money_management_app/core/common/global_variables.dart';

class CustomTextformfield extends StatelessWidget {
  final String hintTextCustom;
  final String labelTextCustom;
  final TextEditingController titleCOntroller;

  CustomTextformfield(
      {Key? key, required this.hintTextCustom, required this.labelTextCustom,required this.titleCOntroller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: w,
        child: TextFormField(
          controller: titleCOntroller,
          decoration: InputDecoration(
              border: const OutlineInputBorder(),
              hintText: hintTextCustom,
              labelText: labelTextCustom),
        ),
      ),
    );
  }
}
