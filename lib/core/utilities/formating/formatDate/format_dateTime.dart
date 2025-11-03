import 'package:intl/intl.dart';

class FormatDateTime {
  static String dateTimeToDDMMYYYY(DateTime dateTime) {
    return DateFormat('dd/MM/yyyy').format(dateTime);
  }

  static String dateTimeToYYYYMMDD(DateTime dateTime) {
    return DateFormat('yyyy/MM/dd').format(dateTime);
  }

  static String isoStringToYYYYMMDD(String isoString) {
    DateTime dateTime = DateTime.parse(isoString);
    return DateFormat('yyyy/MM/dd').format(dateTime);
  }

  static String isoStringToDDMMYYYY(String isoString) {
    DateTime dateTime = DateTime.parse(isoString);
    return DateFormat('dd/MM/yyyy').format(dateTime);
  }
}
