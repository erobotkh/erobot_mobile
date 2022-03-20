import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateHelper {
  DateHelper._internal();

  /// `1990-01-01`
  static DateTime stringToDate(String string) {
    final DateTime dateTime = DateFormat("yyyy-MM-dd").parse(string);
    return dateTime;
  }

  /// `1990-01-01`
  static String dateToString(DateTime date) {
    final String string = DateFormat("yyyy-MM-dd").format(date);
    return string;
  }

  // static String displayDateByStr(String date, {String locale = 'en'}) {
  //   String dateFormat = LocaleFormatService(locale).dateFormat();
  //   final phnomPenhTime = tz.TZDateTime.from(DateTime.parse(date), tz.getLocation('Asia/Phnom_Penh'));
  //   return DateFormat(dateFormat, locale).format(phnomPenhTime).toString();
  // }

  // static String formatDateToStringWithTimeZone(DateTime date, {String locale = 'en'}) {
  //   String dateFormat = LocaleFormatService(locale).dateFormat();
  //   final phnomPenhTime = new tz.TZDateTime.from(date, tz.getLocation('Asia/Phnom_Penh'));
  //   return DateFormat(dateFormat, locale).format(phnomPenhTime).toString();
  // }

  /// `July 10, 2021`
  static String yMMd(BuildContext context, DateTime? dateTime) {
    final DateFormat format = DateFormat.yMMMd();
    return format.format(dateTime!);
  }

  static DateTime now = DateTime.now();
  static DateTime today() => DateTime(
        now.year,
        now.month,
        now.day,
      );
  static DateTime passDay(int dateAgo) => DateTime(
        now.year,
        now.month,
        now.day - dateAgo,
      );
}
