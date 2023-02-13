import 'package:finedust_practice01/format/format_card_layout.dart';
import 'package:finedust_practice01/format/format_card_title.dart';
import 'package:finedust_practice01/my_app/my_text_style.dart';
import 'package:flutter/material.dart';

class TypeCardMain extends StatelessWidget {
  const TypeCardMain({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 160,
        child: FormatCardLayout(
          child: LayoutBuilder(builder: (context, constraint) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const FormatCardTitle(title: '종류별 통계'),
                Expanded(
                  child: ListView(
                    physics: const PageScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    children: List.generate(
                      9,
                      (index) => SizedBox(
                        width: constraint.maxWidth / 3,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('미세먼지', style: MyTextStyle.homeCardContent()),
                              Image.asset('asset/img/best.png', height: 40.0),
                              Column(
                                children: [
                                  Text('나쁨', style: MyTextStyle.homeCardContent()),
                                  Text('53.0㎍/㎥', style: MyTextStyle.homeCardContent()),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
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
