import 'package:finedust_practice01/const/colors.dart';
import 'package:flutter/material.dart';

class FormatCardLayout extends StatelessWidget {
  final Widget child;

  const FormatCardLayout({
    required this.child,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      child: Card(
        color: Color_Main_Light,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(16.0)),
        ),
        child: child,
      ),
    );
  }
}
