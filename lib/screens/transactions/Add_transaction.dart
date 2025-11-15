import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:hive/hive.dart';
import 'package:money_management_app/core/common/widgets/customDropdown_common.dart';
import 'package:money_management_app/core/common/widgets/custom_elevated_button.dart';
import 'package:money_management_app/core/theme/app_theme.dart';
import 'package:money_management_app/core/utilities/custom_snackBar.dart';
import 'package:money_management_app/core/utilities/formating/formatDate/format_dateTime.dart';
import 'package:money_management_app/db/account/account_db.dart';
import 'package:money_management_app/db/category/categor_db.dart';
import 'package:money_management_app/db/transactions/transaction_db.dart';
import 'package:money_management_app/model/accounts/accounts_model.dart';
import 'package:money_management_app/model/category/category_model.dart';
import 'package:money_management_app/model/transaction/transaction_model.dart';

class Add_transaction extends StatefulWidget {
  const Add_transaction({Key? key}) : super(key: key);

  @override
  State<Add_transaction> createState() => _Add_transactionState();
}

final _purposecontroller = TextEditingController();
final _amountcontroller = TextEditingController();
String titlepurpose = '';
double amounttext = 0;
int transactions = 0;

class _Add_transactionState extends State<Add_transaction> {
  CategoryType? _selectedcategorytype;
  CategoryModel? _selectedcategoryModel;
  String? _categoryid;
  double totalbalencetodb = 0;
  double incometodb = 0;
  double expensetodb = 0;
  double overalltransaction = 0; //
  double incomeTransaction = 0;
  double expenseTransaction = 0;

  ///providers
  final selectedDateProvider = StateProvider<DateTime?>(
    (ref) => DateTime.now(),
  );
  final selectedAccountProvider = StateProvider<AccountsModel?>(
    (ref) => null,
  );
  final selectedCategoryProvider = StateProvider<CategoryModel?>(
    (ref) => null,
  );

  @override
  void initState() {
    _selectedcategorytype = CategoryType.expense;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(
              height: 10,
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
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  hintText: '*Enter Amount :',
                  hintStyle: TextStyle(
                    fontWeight: FontWeight.w900,
                  ),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey)),
                ),
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],

              ),
            ),

            //purpose
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextFormField(
                controller: _purposecontroller,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                  hintText: 'title :    "title is recomended',
                  hintStyle: TextStyle(fontWeight: FontWeight.w500),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey)),
                ),
              ),
            ),

            //date
            Consumer(builder: (context, ref, child) {
              final selectedDate = ref.watch(selectedDateProvider);

              return CustomElevatedButton(
                text: FormatDateTime.dateTimeToDDMMYYYY(
                    selectedDate ?? DateTime.now()),
                onPressed: () async {
                  selectDate(ref: ref);
                },
                height: h * 0.05,
                width: w,
                backgroundColor: Palette.popWhite400,
                textColor: Palette.popBlack500,
              );
            }),
            const SizedBox(
              height: 10,
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

            Consumer(
              builder: (context, ref, child) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: FutureBuilder(
                      future: CategoryDB.instance.refreshUI(),
                      builder: (context, snapshot) {
                        return CustomDropdown<CategoryModel>(
                          hintText: "Select a category",
                          items: _selectedcategorytype == CategoryType.income
                              ? CategoryDB().incomeCategoryListlistener.value
                              : CategoryDB().expenseCategoryListlistener.value,
                          displayText: (item) => item.name,
                          onChanged: (selectedCategory) {
                            print(
                                "selected category Id = ${selectedCategory?.id}");
                            _selectedcategoryModel = selectedCategory;
                            _categoryid = selectedCategory?.id;
                            ref.read(selectedCategoryProvider.notifier).update(
                                  (state) => selectedCategory,
                                );
                          },
                          searchHint: "Search for a category",
                          selectedItem: ref.watch(selectedCategoryProvider),
                        );
                      }),
                );
              },
            ),

            SizedBox(
              height: h * 0.001,
            ),

            Consumer(
              builder: (context, ref, child) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: FutureBuilder(
                      future: AccountDB.instance.refresh(),
                      builder: (context, snapshot) {
                        final accountList =
                            AccountDB.instance.accountsListnotifier.value;
                        return CustomDropdown<AccountsModel>(
                          hintText: "Select an account",
                          items: accountList,
                          displayText: (item) => item.name,
                          onChanged: (selectedAccount) {
                            ref.read(selectedAccountProvider.notifier).update(
                                  (state) => selectedAccount,
                                );
                          },
                          searchHint: "Search for an account",
                          selectedItem: ref.watch(selectedAccountProvider),
                        );
                      }),
                );
              },
            ),

            const SizedBox(
              height: 20,
            ),

            //submitbutton
            Consumer(
              builder: (context, ref, child) => CustomElevatedButton(
                  text: "Submit",
                  onPressed: () {
                    print("sumbited");
                    savebutton(context, ref);
                  },
                  height: h * 0.05,
                  width: w,
                  backgroundColor: Palette.popBlack500,),
            )
          ],
        ),
      ),
    );
  }

  Future savebutton(BuildContext ctx, WidgetRef ref) async {
    try {
      final _purposeText = _purposecontroller.text;
      final _amountText = _amountcontroller.text;
      final _dropdownid = _categoryid;
      final selectedAccount = ref.read(selectedAccountProvider);
      final selectedDate = ref.read(selectedDateProvider);
      double currentBalance = 0;

      ///validation
      if (_amountText.isEmpty) {
        showSnackBar(
            content: "Amount is required",
            context: context,
            color: Palette.error);
        return;
      }

      print("print check");

      print("print check1");

      if (_categoryid == null) {
        return showSnackBar(
            content: "Select category", context: context, color: Palette.error);
      }

      if (selectedAccount == null) {
        print("selected account is null");
        return showSnackBar(
            content: "Select an account",
            context: context,
            color: Palette.error);
      }

      final _parsedAmount = double.tryParse(_amountText);
      if (_parsedAmount == null) {
        return;
      }
      if (_selectedcategorytype == CategoryType.expense) {
        _dropdownid;
      }
      print("print check2");

      final AccountsModel? accountData =
          await AccountDB.instance.getSingleAccounts(id: selectedAccount.id);
      if (accountData == null) {
        print("Account model is null $accountData");
        throw Exception("Account model is null $accountData");
      }

      currentBalance = double.parse(accountData.balance);

      //home card.......
      if (_selectedcategorytype == CategoryType.income) {
        print("print check 3");

        totalbalencetodb = totalbalencetodb + _parsedAmount;
        incometodb = incometodb + _parsedAmount;
        //homecard db referencing
        var homecardboxinAddtrans = Hive.box('HomeCarddb');

        //addTottalBalence
        homecardboxinAddtrans.put('totalBalence',
            homecardboxinAddtrans.get('totalBalence') + totalbalencetodb);
        print("print check 4");

        // addIncomeCard
        homecardboxinAddtrans.put(
            'income', homecardboxinAddtrans.get('income') + incometodb);

        currentBalance += _parsedAmount;
      }
      if (_selectedcategorytype == CategoryType.expense) {
        expensetodb = expensetodb - _parsedAmount;
        print("print check 5");

        //homecard db referencing
        var homecardboxinAddtrans = Hive.box('HomeCarddb');

        //subtractTotalBalence
        homecardboxinAddtrans.put('totalBalence',
            homecardboxinAddtrans.get('totalBalence') - _parsedAmount);

        //subtractExpense
        homecardboxinAddtrans.put(
            'expense', homecardboxinAddtrans.get('expense') - expensetodb);

        currentBalance = currentBalance - _parsedAmount;
      }
      print("princt check 6 ${selectedAccount.runtimeType}");

      final _model = TransactionModel(
          purpose: _purposeText,
          amount: _parsedAmount,
          date: selectedDate ?? DateTime.now(),
          type: _selectedcategorytype!,
          category: _selectedcategoryModel!,
          accountsModel: selectedAccount);

      print("accounts model $_model");

      await TransactionDB.instance.addtransactions(_model).then(
        (value) async {
          print("update account triggered ${_parsedAmount}");
          try {
            AccountDB.instance.updateAccount(
                data: AccountsModel(
                    id: _model.accountsModel.id,
                    name: selectedAccount.name,
                    balance: currentBalance.toString(),
                    type: selectedAccount.type));
          } catch (e) {
            return showSnackBar(
                content: "Somenthing went wrong - $e",
                context: context,
                color: Palette.error);
          }
        },
      );
      Navigator.of(context).pop();
      //GSheets..
      // _enterTransaction();
      titlepurpose = _purposeText;
      amounttext = _parsedAmount;
      transactions = transactions + 1;
      TransactionDB.instance.refresh();
      _amountcontroller.text = '';
      _purposecontroller.text = '';
    } catch (e) {
      showSnackBar(
          content: "Something went wrong: ${e.toString()}",
          context: context,
          color: Palette.error);
    }
  }

  selectDate({required WidgetRef ref}) async {
    final selectedDateNotifier = ref.read(selectedDateProvider.notifier);
    final DateTime? _selectedDate = await showDatePicker(
        context: context, firstDate: DateTime(2000), lastDate: DateTime(2050));

    selectedDateNotifier.update(
      (state) => _selectedDate,
    );
  }
}
