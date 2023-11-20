import 'package:intl/intl.dart';

String numbersFormat(int number) {
  NumberFormat formatter = NumberFormat('#,###');
  String formattedNumber = formatter.format(number);
  return formattedNumber;
}
