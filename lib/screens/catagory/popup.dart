import 'package:flutter/material.dart';
import 'package:money_management_app/db/category/categor_db.dart';
import 'package:money_management_app/model/category/category_model.dart';

ValueNotifier<CategoryType> selectedcategoryNotifier =
    ValueNotifier(CategoryType.income);
final _namecontroller = TextEditingController();
Future<void> popup_category(BuildContext context) async {
  showDialog(
    context: context,
    builder: (ctx) {
      return SimpleDialog(
        title: const Text('Add category'),
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextFormField(
              controller: _namecontroller,
              decoration: const InputDecoration(
                hintText: 'Category name',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              children: [
                RadioButton(title: 'income', type: CategoryType.income),
                RadioButton(title: 'expense', type: CategoryType.expense),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: ElevatedButton(
              onPressed: () {
                final _name = _namecontroller.text;
                if (_name.isEmpty) {
                  return;
                }
                final _type = selectedcategoryNotifier.value;
                final _category = CategoryModel(
                  id: DateTime.now().millisecondsSinceEpoch.toString(),
                  name: _name,
                  type: _type,
                );
                CategoryDB.instance.insertCategory(_category);
                Navigator.of(ctx).pop();
                _namecontroller.text = '';
              },
              child: const Text('save'),
            ),
          ),
        ],
      );
    },
  );
}

class RadioButton extends StatelessWidget {
  final String title;
  final CategoryType type;
  const RadioButton({
    required this.title,
    required this.type,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ValueListenableBuilder(
          valueListenable: selectedcategoryNotifier,
          builder: (BuildContext ctx, CategoryType newcategory, Widget? _) {
            return Radio<CategoryType>(
              value: type,
              groupValue: newcategory,
              onChanged: (value) {
                if (value == null) {
                  return;
                } else {
                  selectedcategoryNotifier.value = value;
                }
                selectedcategoryNotifier.notifyListeners();
              },
            );
          },
        ),
        Text(title),
      ],
    );
  }
}
