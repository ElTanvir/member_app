import 'package:intl/intl.dart';

class KELtDateUtil {
  KELtDateUtil._();
  static int getDaysinAmonth({required int year, required int month}) {
    final DateTime x1 = DateTime(year, month, 0).toUtc();
    return DateTime(
      (month == 12) ? year + 1 : year,
      (month == 12) ? 1 : month + 1,
      0,
    ).toUtc().difference(x1).inDays;
  }

  static String getMonthName(int month) {
    return DateFormat('MMMM').format(DateTime(0, month));
  }

  static String getDayName(DateTime date) {
    return DateFormat('EEEE').format(date);
  }
}
