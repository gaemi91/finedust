import 'package:finedust_practice01/const/finedust_status_level.dart';
import 'package:finedust_practice01/model/model_fetch_data.dart';
import 'package:finedust_practice01/model/model_variable.dart';
import 'package:flutter/material.dart';

class MyApp {
  static ValueNotifier<bool> valueNotifierIsExpanded = ValueNotifier(true);
  static ValueNotifier<ItemCode> valueNotifierItemCode = ValueNotifier(ItemCode.PM10);

  static String customDataTime(DateTime date) {
    return '${date.year}-${twoCipher(date.month)}-${twoCipher(date.day)} ${twoCipher(date.hour)}:00';
  }

  static String twoCipher(int val) {
    return val.toString().padLeft(2, '0');
  }

  static ModelVariable currentLevel({required ItemCode itemCode, required double value}) {
    return finedustLevel.where((e) {
      if (itemCode == ItemCode.PM10) {
        return e.minPM10 < value;
      } else if (itemCode == ItemCode.PM25) {
        return e.minPM25 < value;
      } else if (itemCode == ItemCode.CO) {
        return e.minCO < value;
      } else if (itemCode == ItemCode.SO2) {
        return e.minSO2 < value;
      } else if (itemCode == ItemCode.NO2) {
        return e.minNO2 < value;
      } else if (itemCode == ItemCode.O3) {
        return e.minO3 < value;
      } else {
        throw Exception('ItemCode 에러');
      }
    }).last;
  }

  static String itemCodeToUnit(ItemCode itemCode) {
    if (itemCode == ItemCode.PM10) {
      return '㎍/㎥';
    } else if (itemCode == ItemCode.PM25) {
      return '㎍/㎥';
    } else {
      return 'ppm';
    }
  }

  static String itemCodeToKor(ItemCode itemCode) {
    switch (itemCode) {
      case ItemCode.PM10:
        return '미세먼지';
      case ItemCode.PM25:
        return '초미세먼지';
      case ItemCode.O3:
        return '오존';
      case ItemCode.SO2:
        return '아황산가스';
      case ItemCode.NO2:
        return '이산화질소';
      case ItemCode.CO:
        return '일산화탄소';
    }
  }
}
