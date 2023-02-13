import 'package:finedust_practice01/my_app/my_text_style.dart';
import 'package:flutter/material.dart';

class FormatCardTitle extends StatelessWidget {
  final String title;
  final Color colorBG;

  const FormatCardTitle({
    required this.colorBG,
    required this.title,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 3.0),
      decoration: BoxDecoration(
        color: colorBG,
        borderRadius: const BorderRadius.only(
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
