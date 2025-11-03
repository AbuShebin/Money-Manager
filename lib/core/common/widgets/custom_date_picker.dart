import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:intl/intl.dart';

class CustomDatePickerFunction {
 static Future<String?> datePicker(
      {required BuildContext context, required WidgetRef ref}) async {
    final selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now().subtract(const Duration(days: 30)),
      lastDate: DateTime.now(),
    );

    if (selectedDate != null) {
      final String formateddate = DateFormat('ddMMyy').format(selectedDate);
      return formateddate;
    } else {
      return null;
    }
  }
}
