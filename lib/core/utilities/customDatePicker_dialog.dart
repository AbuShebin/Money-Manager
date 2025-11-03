import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';

Future<List<DateTime>> showCustomDatePickerDialog({
  required BuildContext context,
  required DateTime pickedDate,
}) async {
  List<DateTime> selectedDates = [pickedDate];

  await showDialog(
    context: context,
    builder: (BuildContext context) {
      double w = MediaQuery.of(context).size.width;
      return AlertDialog(
        insetPadding: EdgeInsets.all(w * .02),
        title: const Text('Select Date Range'),
        content: SizedBox(
          width: w * .9,
          child: CalendarDatePicker2(
            config: CalendarDatePicker2WithActionButtonsConfig(
              calendarType: CalendarDatePicker2Type.single,
              firstDate: DateTime(1980),
              lastDate: DateTime(2200),
            ),
            value: selectedDates,
            onValueChanged: (dates) => selectedDates = dates,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(null);
            },
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              // context.pop(selectedDates);
              Navigator.pop(context);
            },
            child: const Text('OK'),
          ),
        ],
      );
    },
  );

  return selectedDates;
}
