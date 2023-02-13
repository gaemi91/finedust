import 'package:finedust_practice01/const/colors.dart';
import 'package:finedust_practice01/const/regions.dart';
import 'package:finedust_practice01/model/model_fetch_data.dart';
import 'package:finedust_practice01/model/model_variable.dart';
import 'package:finedust_practice01/my_app/my_app.dart';
import 'package:finedust_practice01/my_app/my_text_style.dart';
import 'package:flutter/material.dart';

typedef RegionSetter = void Function(String region);

class DrawerMain extends StatelessWidget {
  final Map<ItemCode, List<ModelFetchData>> mapFineDust;
  final RegionSetter regionSetter;
  final String regionSelected;

  const DrawerMain({
    required this.regionSetter,
    required this.regionSelected,
    required this.mapFineDust,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final ModelVariable modelVariableByRecentRegionPM10 = MyApp.currentLevel(
      itemCode: ItemCode.PM10,
      value: mapFineDust[ItemCode.PM10]![0].stringToDouble(region: regionSelected),
    );

    return Drawer(
      backgroundColor: modelVariableByRecentRegionPM10.colorBasic,
      child: ListView(
        children: [
          const DrawerHeader(
            child: Text('지역 선택', style: MyTextStyle.drawerLocationChoice()),
          ),
          ...regions.map(
            (e) => ListTile(
              onTap: () {
                regionSetter(e);
                Navigator.of(context).pop();
              },
              tileColor: Colors.white,
              selectedColor: Colors.black,
              selectedTileColor: modelVariableByRecentRegionPM10.colorBright,
              selected: e == regionSelected,
              title: Text(e),
            ),
          )
        ],
      ),
    );
  }
}
