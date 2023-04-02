import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:money_management_app/db/category/categor_db.dart';
import 'package:money_management_app/db/transactions/transaction_db.dart';
import 'package:money_management_app/screens/transactions/Screen_transactions.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../model/category/category_model.dart';

class ScreenStats extends StatefulWidget {
  const ScreenStats({Key? key}) : super(key: key);
  @override
  State<ScreenStats> createState() => _ScreenStatsState();
}
var incometrans;
var expensetrans;
var overalltrans;
class _ScreenStatsState extends State<ScreenStats> {
  // List<Map> _books = [
  //   {'id': 'Income', 'title': 'xxx', 'author': 'xxx'},
  //   {'id': 'Expense', 'title': 'xxx', 'author': 'xxx'},
  //   {'id': 'Overall', 'title': 'xxx', 'author': 'xxx'},
  // ];

  var homecardboxinScreenStats = Hive.box('HomeCarddb');
  var transcounterinStats = Hive.box('transactionscounter');
  

  int touchedIndex = -1;

  double incomeonchart = 0;
  double expenseonchart = 0;
  var incomeAmount;
  var expenseAmount;
  

  @override
  Widget build(BuildContext context) {
    var income = homecardboxinScreenStats.get('income');
    var expense = homecardboxinScreenStats.get('expense');
    var overall = homecardboxinScreenStats.get('totalBalence');
     incometrans=transcounterinStats.get('incomecounter',defaultValue: 1);
     expensetrans=transcounterinStats.get('expensecounter',defaultValue: 1);
     overalltrans=transcounterinStats.get('overallcounter',defaultValue: 1);

     if(transcounterinStats.isEmpty){
      transcounterinStats.put('incomecounter', 1);
      transcounterinStats.put('expensecounter', 1);
      transcounterinStats.put('overallcounter', 1);
     }
    if(transcounterinStats.get('incomecounter')==null){
      transcounterinStats.put('incomecounter', 0);
    }
    if(transcounterinStats.get('expensecounter')==null){
      transcounterinStats.put('expensecounter', 0);
    }
    if(transcounterinStats.get('overallcounter')==null){
      transcounterinStats.put('overallcounter', 0);
    }

    incomeonchart=incomepercentage;
    expenseonchart=expensepercentage;

    if(incomeonchart.isNaN || expenseonchart.isNaN){
      incomeonchart=0;
      expenseonchart=0;
    }

    final List<ChartData> chartData = [
      ChartData('Income', incomeonchart.round().toDouble()),
      ChartData('Expense', expenseonchart.round().toDouble()),
    ];

    if(incomepercentage.isNaN || expensepercentage.isNaN){
      incomepercentage=0;
      expensepercentage=0;
    }

    return Scaffold(
      backgroundColor: Colors.grey[300],
        body: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,l̥M
      children: [
        SfCircularChart(
          legend: Legend(isVisible: true),
          series: <CircularSeries>[
            // Render pie chart
            PieSeries<ChartData, String>(
                dataSource: chartData,
                pointColorMapper: (ChartData data, _) => data.color,
                xValueMapper: (ChartData data, _) => data.x,
                yValueMapper: (ChartData data, _) => data.y,
                dataLabelSettings: const DataLabelSettings(isVisible: true)),
          ],
        ),
        
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              'Income : ${incomepercentage.round()}%',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                  fontSize: 19),
            ),
            Text(
              'Expense : ${expensepercentage.round()}%',
              style: TextStyle(
                  fontWeight: FontWeight.bold, color: Colors.red, fontSize: 19),
            ),
          ],
        ),
        SizedBox(
          height: 100,
        ),
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: Table(
            border: TableBorder.all(),
                 
              
              children: [
                TableRow(
                  children: [
                    Text("Type",style: TextStyle(fontWeight: FontWeight.bold),textScaleFactor: 1.5,),
                    Text("Amount",style: TextStyle(fontWeight: FontWeight.bold),textScaleFactor: 1.5),
                    
                  ]
                ),
                
                 TableRow(
                  children: [
                    Text("Income",style: TextStyle(color: Colors.green,fontWeight: FontWeight.w500),textScaleFactor: 1.5),
                    Text(income.round().toString(),textScaleFactor: 1.5),
                  ]
                ),
                TableRow(
                  children: [
                    Text("Expense",style: TextStyle(color: Colors.red,fontWeight: FontWeight.w500),textScaleFactor: 1.5),
                    Text(expense.round().toString(),textScaleFactor: 1.5),
                  ]
                ),
                TableRow(
                  children: [
                    Text("Overal",style: TextStyle(color: Colors.deepPurple,fontWeight: FontWeight.w500),textScaleFactor: 1.5),
                    Text(overall.round().toString(),textScaleFactor: 1.5),
                  ]
                ),
              ],
          ),
        ),
      ],
        )
       
       
      
    );
  }
}

class ChartData {
  ChartData(this.x, this.y, [this.color]);
  final String x;
  final double y;
  final Color? color;
}
