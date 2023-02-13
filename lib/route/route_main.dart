import 'package:finedust_practice01/component/appbar_main.dart';
import 'package:finedust_practice01/component/drawer_main.dart';
import 'package:finedust_practice01/component/hourly_card_main.dart';
import 'package:finedust_practice01/component/type_card_main.dart';
import 'package:finedust_practice01/const/colors.dart';
import 'package:finedust_practice01/const/regions.dart';
import 'package:finedust_practice01/model/model_fetch_data.dart';
import 'package:finedust_practice01/model/model_variable.dart';
import 'package:finedust_practice01/my_app/my_app.dart';
import 'package:finedust_practice01/repository/repository_data.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class RouteMain extends StatefulWidget {
  const RouteMain({Key? key}) : super(key: key);

  @override
  State<RouteMain> createState() => _RouteMainState();
}

class _RouteMainState extends State<RouteMain> {
  final dio = Dio();
  String region = regions[0];
  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    scrollController.addListener(scrollListener);
  }

  @override
  void dispose() {
    scrollController.removeListener(scrollListener);
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Map<ItemCode, List<ModelFetchData>>>(
        future: dataFetch(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Scaffold(body: Center(child: Text('에러가 있습니다.')));
          }

          if (!snapshot.hasData) {
            return const Scaffold(body: Center(child: CircularProgressIndicator()));
          }

          final Map<ItemCode, List<ModelFetchData>> mapFineDust = snapshot.data!;
          final a = mapFineDust[ItemCode.PM10]![0];

          final ModelVariable modelVariableBy = MyApp.currentLevel(
            itemCode: ItemCode.PM10,
            value: mapFineDust[ItemCode.PM10]![0].stringToDouble(region: region),
          );

          return Scaffold(
            backgroundColor: modelVariableBy.colorBasic,
            drawer: DrawerMain(
              mapFineDust: mapFineDust,
              regionSelected: region,
              regionSetter: (region) {
                setState(() {
                  this.region = region;
                });
              },
            ),
            body: SafeArea(
              child: CustomScrollView(
                controller: scrollController,
                physics: const BouncingScrollPhysics(),
                slivers: [
                  AppBarMain(
                    region: region,
                    mapFineDust: mapFineDust,
                  ),
                  TypeCardMain(
                    region: region,
                    mapFineDust: mapFineDust,
                  ),
                  ValueListenableBuilder(
                    valueListenable: MyApp.valueNotifierItemCode,
                    builder: (context, value, child) => HourlyCardMain(
                      itemCode: value,
                      region: region,
                      mapFineDust: mapFineDust,
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  void scrollListener() {
    final isExpanded = scrollController.offset < 450 - kToolbarHeight;

    if (MyApp.valueNotifierIsExpanded.value != isExpanded) {
      setState(() {
        MyApp.valueNotifierIsExpanded.value = isExpanded;
      });
    }
  }

  Future<Map<ItemCode, List<ModelFetchData>>> dataFetch() async {
    final Map<ItemCode, List<ModelFetchData>> mapFineDust = {};

    List<Future> listFuture = [];

    for (ItemCode itemCode in ItemCode.values) {
      listFuture.add(RepositoryData.fetchData(itemCode: itemCode));
    }

    final listModelFetchData = await Future.wait(listFuture);

    for (int i = 0; i < ItemCode.values.length; i++) {
      mapFineDust.addAll({ItemCode.values[i]: listModelFetchData[i]});
    }

    return mapFineDust;
  }
}
