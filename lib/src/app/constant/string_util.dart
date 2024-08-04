import 'package:intl/intl.dart';

extension DateFormatting on String {
  String toFormattedDateTime() {
    try {
      DateTime dateTime = DateTime.parse(this);
      final DateFormat formatter = DateFormat('HH:mm - dd/MM/yyyy');
      return formatter.format(dateTime);
    } catch (e) {
      return this;
    }
  }
}

extension StringEx on String? {
  bool isNotNullOrEmpty() {
    return this != null && this!.isNotEmpty;
  }
}