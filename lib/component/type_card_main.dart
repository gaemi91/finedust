import 'package:finedust_practice01/format/format_card_layout.dart';
import 'package:finedust_practice01/format/format_card_title.dart';
import 'package:finedust_practice01/model/model_fetch_data.dart';
import 'package:finedust_practice01/model/model_variable.dart';
import 'package:finedust_practice01/my_app/my_app.dart';
import 'package:finedust_practice01/my_app/my_text_style.dart';
import 'package:flutter/material.dart';

class TypeCardMain extends StatelessWidget {
  final String region;
  final Map<ItemCode, List<ModelFetchData>> mapFineDust;

  const TypeCardMain({
    required this.region,
    required this.mapFineDust,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const List<ItemCode> listItemCode = ItemCode.values;
    final ModelVariable modelVariablePM10 = MyApp.currentLevel(
      itemCode: ItemCode.PM10,
      value: mapFineDust[ItemCode.PM10]![0].stringToDouble(region: region),
    );

    return SliverToBoxAdapter(
      child: SizedBox(
        height: 160,
        child: FormatCardLayout(
          colorBG: modelVariablePM10.colorBright,
          child: LayoutBuilder(builder: (context, constraint) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                FormatCardTitle(
                  colorBG: modelVariablePM10.colorDark,
                  title: '종류별 통계',
                ),
                Expanded(
                  child: ListView(
                    physics: const PageScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    children: List.generate(
                      ItemCode.values.length,
                      (index) {
                        final ItemCode itemCode = listItemCode[index];
                        final value = mapFineDust[itemCode]![0].stringToDouble(region: region);

                        final ModelVariable modelVariable = MyApp.currentLevel(
                          itemCode: itemCode,
                          value: value,
                        );

                        return SizedBox(
                          width: constraint.maxWidth / 3,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: InkWell(
                              onTap: () {
                                MyApp.valueNotifierItemCode.value = itemCode;
                              },
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(MyApp.itemCodeToKor(itemCode), style: const MyTextStyle.homeCardContent()),
                                  Image.asset(modelVariable.imgPath, height: 40.0),
                                  Column(
                                    children: [
                                      Text(modelVariable.status, style: const MyTextStyle.homeCardContent()),
                                      Text('$value${MyApp.itemCodeToUnit(itemCode)}',
                                          style: const MyTextStyle.homeCardContent()),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                )
              ],
            );
          }),
        ),
      ),
    );
  }
}
