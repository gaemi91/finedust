import 'package:finedust_practice01/const/colors.dart';
import 'package:finedust_practice01/const/regions.dart';
import 'package:finedust_practice01/my_app/my_text_style.dart';
import 'package:flutter/material.dart';

typedef RegionSetter = void Function(String region);

class DrawerMain extends StatelessWidget {
  final RegionSetter regionSetter;
  final String regionSelected;

  const DrawerMain({
    required this.regionSetter,
    required this.regionSelected,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Color_Main_Basic,
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
              selectedTileColor: Color_Main_Light,
              selected: e == regionSelected,
              title: Text(e),
            ),
          )
        ],
      ),
    );
  }
}
