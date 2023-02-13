import 'package:finedust_practice01/format/format_card_layout.dart';
import 'package:finedust_practice01/format/format_card_title.dart';
import 'package:finedust_practice01/model/model_fetch_data.dart';
import 'package:finedust_practice01/model/model_variable.dart';
import 'package:finedust_practice01/my_app/my_app.dart';
import 'package:finedust_practice01/my_app/my_text_style.dart';
import 'package:flutter/material.dart';

class HourlyCardMain extends StatelessWidget {
  final ItemCode itemCode;
  final String region;
  final Map<ItemCode, List<ModelFetchData>> mapFineDust;

  const HourlyCardMain({
    required this.region,
    required this.mapFineDust,
    required this.itemCode,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ModelVariable modelVariablePM10 = MyApp.currentLevel(
      itemCode: ItemCode.PM10,
      value: mapFineDust[ItemCode.PM10]![0].stringToDouble(region: region),
    );

    return SliverPadding(
      padding: const EdgeInsets.only(top: 5.0, bottom: 10.0),
      sliver: SliverToBoxAdapter(
        child: FormatCardLayout(
          colorBG: modelVariablePM10.colorBright,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              FormatCardTitle(
                colorBG: modelVariablePM10.colorDark,
                title: '시간별 ${MyApp.itemCodeToKor(itemCode)}',
              ),
              Padding(
                padding: const EdgeInsets.only(
                  right: 8.0,
                  left: 8.0,
                  top: 6.0,
                ),
                child: Column(
                  children: List.generate(24, (index) {
                    final modelFetchData = mapFineDust[itemCode]![index];
                    final ModelVariable modelVariable = MyApp.currentLevel(
                      itemCode: itemCode,
                      value: modelFetchData.stringToDouble(region: region),
                    );

                    return Padding(
                      padding: const EdgeInsets.only(bottom: 6.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              '${MyApp.twoCipher(modelFetchData.dataTime.hour)}시',
                              style: const MyTextStyle.homeCardContent(),
                            ),
                          ),
                          Expanded(
                            child: Image.asset(
                              modelVariable.imgPath,
                              height: 20.0,
                            ),
                          ),
                          Expanded(
                            child: Text(
                              modelVariable.status,
                              style: const MyTextStyle.homeCardContent(),
                              textAlign: TextAlign.right,
                            ),
                          )
                        ],
                      ),
                    );
                  }),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
