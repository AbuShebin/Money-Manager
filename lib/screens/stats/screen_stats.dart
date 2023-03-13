

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:money_management_app/db/category/categor_db.dart';
import 'package:money_management_app/screens/transactions/Screen_transactions.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../model/category/category_model.dart';

class ScreenStats extends StatefulWidget {
  const ScreenStats({Key? key}) : super(key: key);
  @override
  State<ScreenStats> createState() => _ScreenStatsState();
}
 var incomonLegent;
  var expenseonLegend;
class _ScreenStatsState extends State<ScreenStats> {
  List<Map> _books = [
    {
      'id': 'Income',
      'title': 'xxx',
      'author': 'xxx'
    },
    {
      'id': 'Expense',
      'title': 'xxx',
      'author': 'xxx'
    },
    {
      'id': 'Overall',
      'title': 'xxx',
      'author': 'xxx'
    },
  ];

  var homecardboxinScreenStats = Hive.box('HomeCarddb');
  
  int touchedIndex = -1;
 
  var incomeonchart=0;
  var expenseonchart=0;
  var incomeAmount;
  var expenseAmount;
  

  @override
    Widget build(BuildContext context) {
        final List<ChartData> chartData = [
            ChartData('Income', incomepercentage.round().toDouble()),
            ChartData('Expense', expensepercentage.round().toDouble()),
            
        ];
        return Scaffold(
            body: Column(
               children:[
                  SfCircularChart(
                    
                    legend: Legend(isVisible: true),
                    series: <CircularSeries>[
                        // Render pie chart
                        PieSeries<ChartData, String>(
                            dataSource: chartData,
                            
                            pointColorMapper:(ChartData data,  _) => data.color,
                            xValueMapper: (ChartData data, _) => data.x,
                            yValueMapper: (ChartData data, _) => data.y,
                            dataLabelSettings:const DataLabelSettings(isVisible: true)
                        ),
                        
                
                    ],
                    
                ),
                SizedBox(height: 20,),
                Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [

                    Text('Income : ${incomepercentage.round()}%',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.blue,fontSize: 19),),
                    Text('Expense : ${expensepercentage.round()}%',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.red,fontSize: 19),),
                  ],
                ),
                SizedBox(height: 40,),
               _createDataTable()
               ],
            ),
          );
    }
    DataTable _createDataTable() {
    return DataTable(columns: _createColumns(), rows: _createRows());
  }
List<DataColumn> _createColumns() {
    return [
      DataColumn(label: Text('Type')),
      DataColumn(label: Text('Amount')),
      DataColumn(label: Text('Transactions'))
    ];
  }
List<DataRow> _createRows() {
    return _books
        .map((book) => DataRow(cells: [
              DataCell(Text( book['id'].toString())),
              DataCell(Text(book['title'])),
              DataCell(Text(book['author']))
            ]))
        .toList();
  }
}

    class ChartData {
        ChartData( this.x, this.y, [this.color]);
        final String x;
        final double y;
        final Color? color;
    }

