// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:money_management_app/core/theme/theme.dart';

class CustomSearchableDropdown<T> extends StatefulWidget {
  final List<T> items;
  final T? selectedItem;
  final String? Function(T item)? displayText;
  final String? searchHint;
  final void Function(T?)? onChanged;
  final String hintText;

  const CustomSearchableDropdown(
      {Key? key,
      required this.items,
      this.selectedItem,
      this.displayText,
      this.searchHint,
      this.onChanged,
      required this.hintText})
      : super(key: key);

  @override
  CustomSearchableDropdownState<T> createState() =>
      CustomSearchableDropdownState<T>();
}

class CustomSearchableDropdownState<T>
    extends State<CustomSearchableDropdown<T>> {
  final TextEditingController _dropSearchController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.sizeOf(context).width;
    double h = MediaQuery.sizeOf(context).height;

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(w * 0.03),
        border: Border.all(color: Colors.grey), // Adjust color if needed
      ),
      child: Column(
        children: [
          DropdownButtonHideUnderline(
            child: DropdownButton2<T>(
              hint: Text(
                widget.hintText,
                style: TextStyle(
                  fontFamily: 'Urbanist',
                  fontSize: w * 0.036,
                  color: Colors.black,
                ),
              ),
              isExpanded: true,
              items: widget.items
                  .map(
                    (item) => DropdownMenuItem<T>(
                      value: item,
                      child: Text(
                        widget.displayText?.call(item) ?? '',
                        style: TextStyle(
                            fontFamily: 'Urbanist',
                            fontSize: w * 0.036,
                            color: Palette.blackColor,
                            fontWeight: FontWeight.w800),
                      ),
                    ),
                  )
                  .toList(),
              value: widget.selectedItem,
              onChanged: widget.onChanged,
              buttonStyleData: ButtonStyleData(
                decoration: BoxDecoration(
                  color: Palette.backgroundColor,
                  borderRadius: BorderRadius.circular(w * 0.03),
                ),
                padding: EdgeInsets.symmetric(horizontal: w * 0.04),
                height: h * .055,
                width: w,
              ),
              dropdownStyleData: DropdownStyleData(
                  maxHeight: h * .4,
                  decoration:
                      const BoxDecoration(color: Palette.backgroundColor)),
              menuItemStyleData: MenuItemStyleData(
                height: h * .06,
              ),
              dropdownSearchData: DropdownSearchData(
                searchController: _dropSearchController,
                searchInnerWidgetHeight: h * 0.06,
                searchInnerWidget: Container(
                  height: h * 0.06,
                  color: Palette.backgroundColor,
                  padding: EdgeInsets.symmetric(horizontal: w * 0.04),
                  child: TextFormField(
                    expands: true,
                    maxLines: null,
                    controller: _dropSearchController,
                    decoration: InputDecoration(
                      isDense: true,
                      contentPadding: EdgeInsets.symmetric(
                          horizontal: w * 0.03, vertical: 8),
                      hintText: widget.searchHint ?? 'Search for an item...',
                      hintStyle: TextStyle(
                        fontFamily: 'Urbanist',
                        fontSize: w * 0.036,
                        color: Palette.blackColor,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(w * 0.02),
                      ),
                    ),
                  ),
                ),
                searchMatchFn: (item, searchValue) {
                  final String itemText = widget.displayText
                          ?.call(item.value as T)
                          ?.toLowerCase() ??
                      '';
                  final String searchValueText = searchValue.toLowerCase();
                  return itemText.contains(searchValueText);
                },
              ),
              onMenuStateChange: (isOpen) {
                if (!isOpen) {
                  _dropSearchController.clear();
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}