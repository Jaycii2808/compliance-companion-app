import 'package:intl/intl.dart';

extension DateTimeFormatting on String {
  String toFormattedDateTime({bool dateOnly = false}) {
    try {
      DateTime dateTime = DateTime.parse(this);
      final DateFormat formatter = dateOnly
          ? DateFormat('dd/MM/yyyy')
          : DateFormat('HH:mm a - dd/MM/yyyy');
      return formatter.format(dateTime);
    } catch (e) {
      return this;
    }
  }

  String getWeekday() {
    DateTime now = DateTime.now();

    int? index = int.tryParse(this);

    if (index == null || index < 0 || index > 6) {
      throw ArgumentError('Invalid index. Must be between 0 and 6.');
    }
    int currentWeekdayIndex = now.weekday - 1;
    int dayDifference = index - currentWeekdayIndex;
    DateTime targetDate = now.add(Duration(days: dayDifference));
    String formattedDay = DateFormat('EEE').format(targetDate);
    return formattedDay;
  }

  Map<String, dynamic> getDateDetails() {
    int? index = int.tryParse(this);
    if (index == null || index < 1 || index > 31) {
      throw ArgumentError('Invalid day. Must be between 1 and 31.');
    }
    DateTime now = DateTime.now();
    int daysInMonth = DateTime(now.year, now.month + 1, 0).day;
    if (index > daysInMonth) {
      throw ArgumentError(
          'Invalid day. The current month has only $daysInMonth days.');
    }

    DateTime targetDate = DateTime(now.year, now.month, index);
    int weekOfMonth = ((targetDate.day - 1) / 7).floor() + 1;
    bool isWeekend = targetDate.weekday == DateTime.saturday ||
        targetDate.weekday == DateTime.sunday;
    String formattedDay = DateFormat('EEE').format(targetDate);
    String formattedDate = DateFormat('yMMMd').format(targetDate);

    String weekendDay = '';
    switch (targetDate.weekday) {
      case 1:
        weekendDay = 'Mon';
        break;
      case 2:
        weekendDay = 'Tue';
        break;
      case 3:
        weekendDay = 'Wed';
        break;
      case 4:
        weekendDay = 'Thu';
        break;
      case 5:
        weekendDay = 'Fri';
        break;
      case 6:
        weekendDay = 'Sat';
        break;
      case 7:
        weekendDay = 'Sun';
        break;
    }

    // Return the details as a Map
    return {
      'day': targetDate.day,
      'formattedDay': formattedDay,
      'formattedDate': formattedDate,
      'weekOfMonth': weekOfMonth,
      'isWeekend': isWeekend,
      'weekendDay': weekendDay,
    };
  }
}

extension DateTimeEx on DateTime {
  int daysInMonth() {
    DateTime datetime = this;
    var firstDayThisMonth =
        DateTime(datetime.year, datetime.month, datetime.day);
    var firstDayNextMonth = DateTime(firstDayThisMonth.year,
        firstDayThisMonth.month + 1, firstDayThisMonth.day);
    return firstDayNextMonth.difference(firstDayThisMonth).inDays;
  }
}
