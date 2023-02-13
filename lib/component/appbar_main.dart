import 'package:finedust_practice01/const/colors.dart';
import 'package:finedust_practice01/model/model_fetch_data.dart';
import 'package:finedust_practice01/model/model_variable.dart';
import 'package:finedust_practice01/my_app/my_app.dart';
import 'package:finedust_practice01/my_app/my_text_style.dart';
import 'package:flutter/material.dart';

class AppBarMain extends StatelessWidget {
  final String region;
  final Map<ItemCode, List<ModelFetchData>> mapFineDust;

  const AppBarMain({
    required this.region,
    required this.mapFineDust,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ModelFetchData modelFetchData = mapFineDust[ItemCode.PM10]![0];

    final ModelVariable modelVariableByRecentRegionPM10 = MyApp.currentLevel(
      itemCode: ItemCode.PM10,
      value: mapFineDust[ItemCode.PM10]![0].stringToDouble(region: region),
    );

    return SliverAppBar(
      stretch: true,
      expandedHeight: 450,
      backgroundColor: modelVariableByRecentRegionPM10.colorBasic,
      pinned: true,
      centerTitle: true,
      title: ValueListenableBuilder(
        valueListenable: MyApp.valueNotifierIsExpanded,
        builder: (context, value, child) =>
            Text(!value ? '$region  ${MyApp.customDataTime(modelFetchData.dataTime)}' : ''),
      ),
      flexibleSpace: FlexibleSpaceBar(
        background: Padding(
          padding: const EdgeInsets.only(top: kToolbarHeight),
          child: Column(
            children: [
              Text(region, style: const MyTextStyle.homeAppBarLocation()),
              const SizedBox(height: 10.0),
              Text(MyApp.customDataTime(modelFetchData.dataTime), style: const MyTextStyle.homeAppBarDateTime()),
              const SizedBox(height: 20.0),
              Image.asset(modelVariableByRecentRegionPM10.imgPath, height: 140),
              const SizedBox(height: 20.0),
              Text(modelVariableByRecentRegionPM10.status, style: const MyTextStyle.homeAppBarStatus()),
              const SizedBox(height: 10.0),
              Text(modelVariableByRecentRegionPM10.comment, style: const MyTextStyle.homeAppBarComments())
            ],
          ),
        ),
      ),
    );
  }
}
