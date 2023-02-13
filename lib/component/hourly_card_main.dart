import 'package:finedust_practice01/format/format_card_layout.dart';
import 'package:finedust_practice01/format/format_card_title.dart';
import 'package:finedust_practice01/my_app/my_text_style.dart';
import 'package:flutter/material.dart';

class HourlyCardMain extends StatelessWidget {
  const HourlyCardMain({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.only(top:5.0,bottom: 10.0),
      sliver: SliverToBoxAdapter(
        child: FormatCardLayout(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              FormatCardTitle(
                title: '시간별 초미세먼지',
              ),
              Padding(
                padding: const EdgeInsets.only(
                  right: 8.0,
                  left: 8.0,
                  top: 6.0,
                ),
                child: Column(
                  children: List.generate(
                      24,
                      (index) => Padding(
                        padding: const EdgeInsets.only(bottom: 6.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '10시',
                                  style: MyTextStyle.homeCardContent(),
                                ),
                                Image.asset(
                                  'asset/img/best.png',
                                  height: 20.0,
                                ),
                                Text(
                                  '보통',
                                  style: MyTextStyle.homeCardContent(),
                                )
                              ],
                            ),
                      )),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
