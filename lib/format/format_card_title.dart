import 'package:finedust_practice01/const/colors.dart';
import 'package:finedust_practice01/my_app/my_text_style.dart';
import 'package:flutter/material.dart';

class FormatCardTitle extends StatelessWidget {
  final String title;

  const FormatCardTitle({
    required this.title,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 3.0),
      decoration: const BoxDecoration(
        color: Color_Main_Dark,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(16.0),
          topLeft: Radius.circular(16.0),
        ),
      ),
      child: Text(
        title,
        style: const MyTextStyle.homeCardTitle(),
        textAlign: TextAlign.center,
      ),
    );
  }
}
