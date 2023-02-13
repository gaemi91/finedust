import 'package:flutter/material.dart';

class ModelVariable {
  final int level;
  final Color colorDark;
  final Color colorBasic;
  final Color colorBright;
  final String imgPath;
  final String status;
  final String comment;
  final double minPM10;
  final double minPM25;
  final double minO3;
  final double minNO2;
  final double minCO;
  final double minSO2;

  ModelVariable({
    required this.level,
    required this.colorDark,
    required this.colorBasic,
    required this.colorBright,
    required this.imgPath,
    required this.status,
    required this.comment,
    required this.minPM10,
    required this.minPM25,
    required this.minO3,
    required this.minNO2,
    required this.minCO,
    required this.minSO2,
  });
}
