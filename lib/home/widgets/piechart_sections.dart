import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';

import '../../screens/stats/pie_data.dart';

List<PieChartSectionData> getSections() =>
    PieData.data
    .asMap()
    .map<int, PieChartSectionData>((index, data) {
      final value=PieChartSectionData(
        color: data.color,
        value: data.percentage,
        title: '${data.percentage}%',
        titleStyle:const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Color(0xffffffff)
        )
      );

      return MapEntry(index, value);
    })
    .values
    .toList();
