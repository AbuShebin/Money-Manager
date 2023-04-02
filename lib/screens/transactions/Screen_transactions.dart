import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';
import 'package:money_management_app/db/category/categor_db.dart';
import 'package:money_management_app/db/transactions/transaction_db.dart';
import 'package:money_management_app/model/category/category_model.dart';
import 'package:money_management_app/model/transaction/transaction_model.dart';
import 'package:money_management_app/screens/stats/screen_stats.dart';
import 'package:money_management_app/screens/transactions/Add_transaction.dart';
import 'package:path_provider/path_provider.dart';

class Screen_transactions extends StatefulWidget {
  const  Screen_transactions({Key? key, }) : super(key: key);

  @override
  State<Screen_transactions> createState() => _Screen_transactionsState();
}

var income;//canged to var frm double
var expense;//was double
var totalincomeexpense;//was double
double incomepercentage=0;
double expensepercentage=0;
var totalbalenceTostats;



class _Screen_transactionsState extends State<Screen_transactions> {
  @override
  Widget build(BuildContext context) {
    TransactionDB.instance.refresh(); 
    CategoryDB.instance.refreshUI();
    var incomefrmDB;
    var expensefrmDB;

    return ValueListenableBuilder(
        valueListenable: TransactionDB.instance.transactionListnotifier,
        builder: (BuildContext ctx, List<TransactionModel> newList, Widget? _) {
          //homecard db referencing
          var homecardboxinScreentrans = Hive.box('HomeCarddb');

          //transcounterTable db referencing
          var transcounterintrans = Hive.box('transactionscounter');

          //adding value in initial case
          if (homecardboxinScreentrans.isEmpty) {
            homecardboxinScreentrans.put('totalBalence', 0); 
          }

          if (homecardboxinScreentrans.get('income') == null) {
            homecardboxinScreentrans.put('income', 0);
          }

          if (homecardboxinScreentrans.get('expense') == null) {
            homecardboxinScreentrans.put('expense', 0);
          }

          //getting value from DB
          var totalbalencefrmDB = homecardboxinScreentrans.get('totalBalence');
          incomefrmDB = homecardboxinScreentrans.get('income');
          expensefrmDB = homecardboxinScreentrans.get('expense');



          //get value frm DB for screen stats
          income=homecardboxinScreentrans.get('income');
          expense=homecardboxinScreentrans.get('expense');
          totalincomeexpense=income+expense;
          incomepercentage=income/totalincomeexpense*100;
          expensepercentage=expense/totalincomeexpense*100;

          //tostats
          totalbalenceTostats=totalbalencefrmDB;

          return Column(children: [
            const SizedBox(
              height: 10,
            ),
            Container(
              width: 400,
              height: 190,
              margin: const EdgeInsets.only(left: 15, right: 15),
              child: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(colors: [
                    Colors.deepPurple,
                    Colors.blueAccent,
                  ]),
                  borderRadius: BorderRadius.all(
                    Radius.circular(24),
                  ),
                ),
                padding: const EdgeInsets.all(15),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      'B A L A N C E',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 22.0,
                          color: Colors.white),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Rs ${totalbalencefrmDB.round()}',
                      style: const TextStyle(
                          fontSize: 26.0,
                          fontWeight: FontWeight.w700,
                          color: Colors.white),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.white70,
                                  borderRadius: BorderRadius.circular(
                                    24.0,
                                  )),
                              padding: const EdgeInsets.all(6),
                              child: const Icon(
                                Icons.arrow_downward,
                                color: Colors.green,
                              ),
                              margin: const EdgeInsets.only(right: 8.0),
                            ),
                            Column(
                              children: [
                                const Text(
                                  'Income',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14.0,
                                      color: Colors.white70),
                                ),
                                Column(
                                  children: [
                                    Text(
                                      incomefrmDB.round().toString(),
                                      style: const TextStyle(
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.w700,
                                          color: Colors.white70),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(
                          width: 90,
                        ),
                        Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.white70,
                                  borderRadius: BorderRadius.circular(
                                    24.0,
                                  )),
                              padding: const EdgeInsets.all(6),
                              child: const Icon(
                                Icons.arrow_upward,
                                color: Colors.red,
                              ),
                              margin: const EdgeInsets.only(right: 8.0),
                            ),
                            Column(
                              children: [
                                const Text(
                                  'Expense',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14.0,
                                      color: Colors.white70),
                                ),
                                Text(
                                  expensefrmDB.round().toString(),
                                  style: const TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.white70),
                                )
                              ],
                            )
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [
                Padding(
                  padding: EdgeInsets.only(left: 15, top: 40),
                  child: Text(
                    "Recent Transactions...",
                    style: TextStyle(
                      color: Colors.deepPurple,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
                child: ListView.separated(
              itemBuilder: (ctx, index) {
                final _value = newList[index];
                return Slidable(
                  key: Key(_value.id!),
                  startActionPane: ActionPane(
                    motion: const ScrollMotion(),
                    children: [
                      SlidableAction(
                        onPressed: (ctx) {
                          TransactionDB.instance.deleteTransancion(_value.id!);
                          final amnt = _value.amount;
                          if (_value.type == CategoryType.income) {
                            homecardboxinScreentrans.put(
                                'totalBalence',
                                homecardboxinScreentrans.get('totalBalence') -
                                    amnt);
                            
                            homecardboxinScreentrans.put('income',
                                homecardboxinScreentrans.get('income') - amnt);

                               //incometrans counter...
                              // var  incomedlt=incometrans-1;
                              //   transcounterintrans.put('incomecounter', transcounterintrans.get('incomecounter')-incomedlt);

                              //   //overalltrans counter...
                              //  var overalldlt=overalltrans-1;
                              //  transcounterintrans.put('overallcounter', transcounterintrans.get('overallcounter')-overalldlt);
                          }
                          if (_value.type == CategoryType.expense) {
                            homecardboxinScreentrans.put(
                                'totalBalence',
                                homecardboxinScreentrans.get('totalBalence') +
                                    amnt);

                            homecardboxinScreentrans.put('expense',
                                homecardboxinScreentrans.get('expense') - amnt);

                                //expensetrans counter...
                              //   var expensedlt=expensetrans-1;
                              //   transcounterintrans.put('expensecounter', transcounterintrans.get('expensecounter')-expensedlt);

                              //   //overalltrans counter...
                              //    var overalldlt=overalltrans-1;
                              //  transcounterintrans.put('overallcounter', transcounterintrans.get('overallcounter')-overalldlt);
                          }
                        },
                        icon: Icons.delete,
                        label: 'delete',
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 10,
                      right: 10,
                      top: 10,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Card(
                        elevation: 10,
                        child: ListTile(
                          tileColor: Colors.grey[200],
                          leading: CircleAvatar(
                            child: Text(
                              parseDate(_value.date),
                              style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 14),
                              textAlign: TextAlign.center,
                            ),
                            radius: (25),
                            backgroundColor: _value.type == CategoryType.income
                                ? Colors.green
                                : Colors.red,
                          ),
                          
                          title: Text('Rs  ${_value.amount}',style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),),
                          subtitle: Text(_value.purpose,style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),),
                          trailing: Text(_value.category.name,style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),),
                        ),
                      ),
                    ),
                  ),
                );
              },
              separatorBuilder: (ctx, index) {
                return const SizedBox(
                  height: 10,
                );
              },
              itemCount: newList.length,
            ))
          ]);
        });
  }
}

String parseDate(DateTime date) {
  final _date = DateFormat.MMMd().format(date);
  final _splitedate = _date.split(' ');
  return '${_splitedate.last}\n ${_splitedate.first}';
}
