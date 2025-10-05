import 'package:flutter/material.dart';
import 'package:money_management_app/core/theme/theme.dart';


class CustomDropdown<DropDownItemModel> extends StatelessWidget {
  final String title;
  final List<DropdownMenuItem<DropDownItemModel>> items;
  final DropDownItemModel? selectedValue;
  final void Function(DropDownItemModel?) onChanged;
  final String? errorText;

  const CustomDropdown(
      {
      required this.items,
      required this.selectedValue,
      required this.onChanged,
      required this.title,
      this.errorText});

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;

    return Container(
      height: h * 0.06,
      decoration: BoxDecoration(
        color: Palette.backgroundColor,
        borderRadius: BorderRadius.circular(w * 0.03),
        border: Border.all(
          color: errorText == null ? Colors.grey : Colors.red,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: w * 0.03),
        child: DropdownButton<DropDownItemModel>(
          isExpanded: true,
          padding: const EdgeInsets.symmetric(horizontal: 3),
          hint: Text(
            title,
            style: TextStyle(
              fontFamily: 'Urbanist',
              fontSize: w * 0.036,
              color: Palette.blackColor,
            ),
          ),
          items: items,
          style: TextStyle(
            fontFamily: 'Urbanist',
            fontSize: w * 0.036,
            color: Palette.blackColor,
          ),
          value: selectedValue,
          onChanged: onChanged,
          underline: Container(),
          dropdownColor: Palette.backgroundColor,
          selectedItemBuilder: (BuildContext context) {
            return items
                .map<Widget>((DropdownMenuItem<DropDownItemModel> item) {
              return Center(
                child: Text(
                  item.value.toString(),
                  style: TextStyle(
                    fontFamily: 'Urbanist',
                    fontSize: w * 0.036,
                    color: Palette.blackColor,
                  ),
                ),
              );
            }).toList();
          },
        ),
      ),
    );
  }
}
