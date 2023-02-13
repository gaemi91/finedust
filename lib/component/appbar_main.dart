import 'package:finedust_practice01/const/colors.dart';
import 'package:finedust_practice01/my_app/my_app.dart';
import 'package:finedust_practice01/my_app/my_text_style.dart';
import 'package:flutter/material.dart';

class AppBarMain extends StatelessWidget {
  final String region;
  const AppBarMain({
    required this.region,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      stretch: true,
      expandedHeight: 450,
      backgroundColor: Color_Main_Basic,
      pinned: true,
      centerTitle: true,
      title: ValueListenableBuilder(
        valueListenable: MyApp.valueNotifierIsExpanded,
        builder: (context, value, child) => Text(!value ? '서울  2023-02-11 10:00' : ''),
      ),
      flexibleSpace: FlexibleSpaceBar(
        background: Padding(
          padding: const EdgeInsets.only(top: kToolbarHeight),
          child: Column(
            children: [
              Text(region, style: MyTextStyle.homeAppBarLocation()),
              const SizedBox(height: 10.0),
              Text('2023-02-11 10:00', style: MyTextStyle.homeAppBarDateTime()),
              const SizedBox(height: 20.0),
              Image.asset('asset/img/best.png', height: 140),
              const SizedBox(height: 20.0),
              Text('매우 좋음', style: MyTextStyle.homeAppBarStatus()),
              const SizedBox(height: 10.0),
              Text('공기가 너무 좋아요!', style: MyTextStyle.homeAppBarComments())
            ],
          ),
        ),
      ),
    );
  }
}
