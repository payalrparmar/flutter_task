
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


class Utils {

  // static String localNotificationPayload;
  static String fcmToken = '';
  static String deviceId = '';

  static Future<bool> checkConnection() async {
    var result = await Connectivity().checkConnectivity();
    return result == ConnectivityResult.mobile ||
        result == ConnectivityResult.wifi;
  }

  static List<String> getDateList(int count) {
    List<String> dateList = [];
    var now = DateTime.now();
    dateList.add(now.toIso8601String());
    for (int index = 1; index < count; index++)
      dateList.add(now.add(Duration(days: index)).toIso8601String());
    return dateList;
  }

  static String formatTimeOfDay(TimeOfDay tod, String formatText) {
    final now = new DateTime.now();
    final dt = DateTime(now.year, now.month, now.day, tod.hour, tod.minute);
    final dateFormat = DateFormat(formatText);
    var format = dateFormat.format(dt);
    return format;
  }

  static String currentDateTimeInFormat(String format) {
    final dateFormat = DateFormat(format);
    var now = DateTime.now();
    return dateFormat.format(now);
  }

  static String dateTimeInFormat(String date, String formatText) {
    final dateFormat = DateFormat(formatText);
    DateTime parse = DateTime.parse(date); // 2019-06-26T12:09:17.339001
    var format = dateFormat.format(parse);
    return format;
  }

  static String getDate(String date) {
    return DateTime.parse(date).day.toString();
  }

  static String getMonth(String date) {
    return DateTime.parse(date).month.toString();
  }

  static String capitalize(String s) => s[0].toUpperCase() + s.substring(1);
}
