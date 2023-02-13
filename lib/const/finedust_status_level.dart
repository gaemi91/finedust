/*
  * 1) 최고
  *
  * 미세먼지 : 0-15
  * 초미세먼지 : 0-8
  * 오존(O3) : 0-0.02
  * 이산화질소(NO2) : 0-0.02
  * 일산화탄소(CO) : 0-0.02
  * 아황산가스(SO2) : 0-0.01
  *
  * 2) 좋음
  *
  * 미세먼지 : 16-30
  * 초미세먼지 : 9-15
  * 오존 : 0.02 - 0.03
  * 이산화질소 : 0.02-0.03
  * 일산화탄소 : 1-2
  * 아황산가스 : 0.01-0.02
  *
  * 3) 양호
  *
  * 미세먼지 : 31-40
  * 초미세먼지 : 16-20
  * 오존 : 0.03-0.06
  * 이산화질소 : 0.03-0.05
  * 일산화탄소 : 2-5.5
  * 아황산가스 : 0.02-0.04
  *
  * 4) 보통
  *
  * 미세먼지 : 41-50
  * 초미세먼지 : 21-25
  * 오존 : 0.06-0.09
  * 이산화질소 : 0.05-0.06
  * 일산화탄소 : 5.5-9
  * 아황산가스 : 0.04-0.05
  *
  * 5) 나쁨
  *
  * 미세먼지 : 51-75
  * 초미세먼지 : 26-37
  * 오존 : 0.09-0.12
  * 이산화질소 : 0.06-0.13
  * 일산화탄소 : 9-12
  * 아황산가스 : 0.05-0.1
  *
  * 6) 상당히나쁨
  *
  * 미세먼지 : 76-100
  * 초미세먼지 : 38-50
  * 오존 : 0.12-0.15
  * 이산화질소 : 0.13-0.2
  * 일산화탄소 : 12-15
  * 아황산가스 : 0.1-0.15
  *
  * 7) 매우 나쁨
  *
  * 미세먼지 : 101-150
  * 초미세먼지 : 51-75
  * 오존 : 0.15-0.38
  * 이산화질소 : 0.2-1.1
  * 일산화탄소 : 15-32
  * 아황산가스 : 0.15-0.16
  *
  * 8) 최악
  *
  * 미세먼지 : 151~
  * 초미세먼지 : 76~
  * 오존 : 0.38~
  * 이산화질소 : 1.1~
  * 일산화탄소 : 32~
  * 아황산가스 : 0.16~
  * */

import 'package:finedust_practice01/model/model_variable.dart';
import 'package:flutter/material.dart';

final finedustLevel = [
  //최고
  ModelVariable(
    level: 0,
    status: '최고',
    comment: '우와! 100년에 한번 오는날!',
    colorBasic: const Color(0xFF2196F3),
    colorDark: const Color(0xFF0069C0),
    colorBright: const Color(0xFF6EC6FF),
    imgPath: 'asset/img/best.png',
    minPM10: 0,
    minPM25: 0,
    minO3: 0,
    minNO2: 0,
    minCO: 0,
    minSO2: 0,
  ),

  //좋음
  ModelVariable(
    level: 1,
    status: '좋음',
    comment: '공기가 좋아요! 외부활동 해도 좋아요!',
    colorBasic: const Color(0xFF03a9f4),
    colorDark: const Color(0xFF007ac1),
    colorBright: const Color(0xFF67daff),
    imgPath: 'asset/img/good.png',
    minPM10: 16,
    minPM25: 9,
    minO3: 0.02,
    minNO2: 0.02,
    minCO: 1,
    minSO2: 0.01,
  ),

  //양호
  ModelVariable(
    level: 2,
    status: '양호',
    comment: '공기가 좋은 날이에요!',
    colorBasic: const Color(0xFF00bcd4),
    colorDark: const Color(0xFF008ba3),
    colorBright: const Color(0xFF62efff),
    imgPath: 'asset/img/ok.png',
    minPM10: 31,
    minPM25: 16,
    minO3: 0.03,
    minNO2: 0.03,
    minCO: 2,
    minSO2: 0.02,
  ),

  //보통
  ModelVariable(
    level: 3,
    status: '보통',
    comment: '나쁘지 않네요!',
    colorBasic: const Color(0xFF009688),
    colorDark: const Color(0xFF00675b),
    colorBright: const Color(0xFF52c7b8),
    imgPath: 'asset/img/mediocre.png',
    minPM10: 41,
    minPM25: 21,
    minO3: 0.06,
    minNO2: 0.05,
    minCO: 5.5,
    minSO2: 0.04,
  ),

  //나쁨
  ModelVariable(
    level: 4,
    status: '나쁨',
    comment: '공기가 안좋아요...',
    colorBasic: const Color(0xFFffc107),
    colorDark: const Color(0xFFc79100),
    colorBright: const Color(0xFFfff350),
    imgPath: 'asset/img/bad.png',
    minPM10: 51,
    minPM25: 26,
    minO3: 0.09,
    minNO2: 0.06,
    minCO: 9,
    minSO2: 0.05,
  ),

  //상당히나쁨
  ModelVariable(
    level: 5,
    status: '상당히 나쁨',
    comment: '공기가 나빠요! 외부활동을 자제해주세요!',
    colorBasic: const Color(0xFFff9800),
    colorDark: const Color(0xFFc66900),
    colorBright: const Color(0xFFffc947),
    imgPath: 'asset/img/very_bad.png',
    minPM10: 76,
    minPM25: 38,
    minO3: 0.12,
    minNO2: 0.13,
    minCO: 12,
    minSO2: 0.1,
  ),

  //매우 나쁨
  ModelVariable(
    level: 6,
    status: '매우 나쁨',
    comment: '매우 안좋아요! 나가지 마세요!',
    colorBasic: const Color(0xFFf44336),
    colorDark: const Color(0xFFba000d),
    colorBright: const Color(0xFFff7961),
    imgPath: 'asset/img/worse.png',
    minPM10: 101,
    minPM25: 51,
    minO3: 0.15,
    minNO2: 0.2,
    minCO: 15,
    minSO2: 0.15,
  ),

  //최악
  ModelVariable(
    level: 7,
    status: '최악',
    comment: '역대급 최악의 날! 집에만 계세요!',
    colorBasic: const Color(0xFF212121),
    colorDark: const Color(0xFF000000),
    colorBright: const Color(0xFF484848),
    imgPath: 'asset/img/worst.png',
    minPM10: 151,
    minPM25: 76,
    minO3: 0.38,
    minNO2: 1.1,
    minCO: 32,
    minSO2: 0.16,
  )
];
