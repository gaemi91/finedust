import 'package:flutter/material.dart';

class MyApp {
  static ValueNotifier<bool> valueNotifierIsExpanded = ValueNotifier(true);

  static String customDataTime(DateTime date) {
    return '${date.year}-${twoCipher(date.month)}-${twoCipher(date.day)} ${twoCipher(date.hour)}:00';
  }

  static String twoCipher(int val) {
    return val.toString().padLeft(2, '0');
  }
}
