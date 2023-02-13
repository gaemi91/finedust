import 'package:flutter/material.dart';

class MyTextStyle extends TextStyle {
  const MyTextStyle({
    Color color = Colors.white,
    double? fontSize,
    FontWeight fontWeight = FontWeight.w700,
  }) : super(
    color: color,
    fontSize: fontSize,
    fontWeight: fontWeight,
  );

  const MyTextStyle.homeAppBarLocation() : this(fontSize: 40.0);
  const MyTextStyle.homeAppBarDateTime() : this(fontSize: 20.0, fontWeight: FontWeight.normal);
  const MyTextStyle.homeAppBarStatus() : this(fontSize: 40.0); //보통,나쁨 등등
  const MyTextStyle.homeAppBarComments() : this(fontSize: 20.0); //나쁘지 않네요! 등등
  const MyTextStyle.drawerLocationChoice() : this(fontSize: 20.0, fontWeight: FontWeight.normal); //지역 선택
  const MyTextStyle.homeCardTitle() : this();
  const MyTextStyle.homeCardContent() : this(color: Colors.black, fontWeight: FontWeight.w400); //category,status,level

}
