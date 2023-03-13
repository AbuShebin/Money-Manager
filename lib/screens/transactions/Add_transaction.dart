import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:money_management_app/db/category/categor_db.dart';
import 'package:money_management_app/db/transactions/transaction_db.dart';
import 'package:money_management_app/model/category/category_model.dart';
import 'package:money_management_app/model/transaction/transaction_model.dart';

class Add_transaction extends StatefulWidget {
  const Add_transaction({Key? key}) : super(key: key);

  @override
  State<Add_transaction> createState() => _Add_transactionState();
}

final _purposecontroller = TextEditingController();
final _amountcontroller = TextEditingController();

class _Add_transactionState extends State<Add_transaction> {
  DateTime? _selectedDate;
  CategoryType? _selectedcategorytype;
  CategoryModel? _selectedcategoryModel;
  String? _categoryid;
  double totalbalencetodb = 0;
  double incometodb = 0;
  double expensetodb = 0;

  @override
  void initState() {
    _selectedcategorytype = CategoryType.expense;
    _selectedDate = DateTime.now();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffe2e7ef),
      appBar: AppBar(
        toolbarHeight: 0,
      ),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            const Text(
              "Add Transaction",
              style: TextStyle(
                fontSize: 32.0,
                fontWeight: FontWeight.w600,
                fontFamily: 'Ubuntu',
              ),
            ),
            //sizedbox
            const SizedBox(
              height: 10,
            ),

            //amount
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextFormField(
                controller: _amountcontroller,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey)),
                    hintText: 'Enter Amount :',
                    hintStyle: TextStyle(
                      fontWeight: FontWeight.w900,
                    )),
              ),
            ),

            //purpose
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextFormField(
                controller: _purposecontroller,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                  hintText: 'title :',
                  hintStyle: TextStyle(fontWeight: FontWeight.w500),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey)),
                ),
              ),
            ),

            //date

            TextButton.icon(
              onPressed: () async {
                final _selectedDateTemp = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime.now().subtract(const Duration(days: 30)),
                  lastDate: DateTime.now(),
                );
                if (_selectedDateTemp == null) {
                  return;
                } else {
                  //print(_selectedDateTemp.toString());
                  setState(() {
                    _selectedDate = _selectedDateTemp;
                  });
                }
              },
              icon: const Icon(Icons.calendar_today),
              label: Text(
                _selectedDate == null
                    ? 'select date'
                    : _selectedDate.toString(),
              ),
            ),

            const SizedBox(
              height: 20,
            ),

            //Radiobutton
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  children: [
                    Radio(
                        value: CategoryType.income,
                        groupValue: _selectedcategorytype,
                        onChanged: (newvalue) {
                          setState(() {
                            _selectedcategorytype = CategoryType.income;
                            _categoryid = null;
                          });
                        }),
                    const Text('income'),
                  ],
                ),
                Row(
                  children: [
                    Radio(
                      value: CategoryType.expense,
                      groupValue: _selectedcategorytype,
                      onChanged: (newvalue) {
                        setState(() {
                          _selectedcategorytype = CategoryType.expense;
                          _categoryid = null;
                        });
                      },
                    ),
                    const Text('expense')
                  ],
                ),
              ],
            ),

            //Dropdownmenu
            DropdownButton<String>(
              hint: const Text('select category'),
              value: _categoryid,
              items: (_selectedcategorytype == CategoryType.income
                      ? CategoryDB().incomeCategoryListlistener
                      : CategoryDB().expenseCategoryListlistener)
                  .value
                  .map((e) {
                return DropdownMenuItem(
                  value: e.id,
                  child: Text(e.name),
                  onTap: () {
                    _selectedcategoryModel = e;
                  },
                );
              }).toList(),
              onChanged: (selectedvalue) {
                setState(() {
                  _categoryid = selectedvalue;
                });
              },
            ),
            const SizedBox(
              height: 20,
            ),
            //submitbutton
            ElevatedButton(
              onPressed: () {
                savebutton();
              },
              child: const Text('submit'),
            )
          ],
        ),
      ),
    );
  }

  Future savebutton() async {
    final _purposeText = _purposecontroller.text;
    final _amountText = _amountcontroller.text;
    final _dropdownid = _categoryid;
    /* if (_purposeText.isEmpty) {
      return;
    }
    */
    if (_amountText.isEmpty) {
      return;
    }
    if (_categoryid == null) {
      return;
    }
    if (_selectedDate == null) {
      return;
    }

    final _parsedAmount = double.tryParse(_amountText);
    if (_parsedAmount == null) {
      return;
    }
    if (_selectedcategorytype == CategoryType.expense) {
      _dropdownid;
    }

      //home card.......
    if (_selectedcategorytype == CategoryType.income) {
      totalbalencetodb = totalbalencetodb + _parsedAmount;
      incometodb = incometodb + _parsedAmount;
      //homecard db referencing
      var homecardboxinAddtrans = Hive.box('HomeCarddb');

      //addTottalBalence
      homecardboxinAddtrans.put('totalBalence',
          homecardboxinAddtrans.get('totalBalence') + totalbalencetodb);

      // addIncomeCard
      homecardboxinAddtrans.put(
          'income', homecardboxinAddtrans.get('income') + incometodb);
    }
    if (_selectedcategorytype == CategoryType.expense) {
      expensetodb = expensetodb - _parsedAmount;

      //homecard db referencing
      var homecardboxinAddtrans = Hive.box('HomeCarddb');

      //subtractTotalBalence
      homecardboxinAddtrans.put('totalBalence',
          homecardboxinAddtrans.get('totalBalence') - _parsedAmount);

      //subtractExpense
      homecardboxinAddtrans.put(
          'expense', homecardboxinAddtrans.get('expense') - expensetodb);
    }

    final _model = TransactionModel(
      purpose: _purposeText,
      amount: _parsedAmount,
      date: _selectedDate!,
      type: _selectedcategorytype!,
      category: _selectedcategoryModel!,
    );
    await TransactionDB.instance.addtransactions(_model);
    Navigator.of(context).pop();
    TransactionDB.instance.refresh();
    _amountcontroller.text = '';
    _purposecontroller.text = '';
  }
}
