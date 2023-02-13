import 'package:finedust_practice01/component/appbar_main.dart';
import 'package:finedust_practice01/component/drawer_main.dart';
import 'package:finedust_practice01/component/hourly_card_main.dart';
import 'package:finedust_practice01/component/type_card_main.dart';
import 'package:finedust_practice01/const/colors.dart';
import 'package:finedust_practice01/const/regions.dart';
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

  pullData()async{

  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color_Main_Basic,
      drawer: DrawerMain(
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
            ),
            TypeCardMain(),
            HourlyCardMain(),
          ],
        ),
      ),
    );
  }

  void scrollListener() {
    final isExpanded = scrollController.offset < 450 - kToolbarHeight;

    if (MyApp.valueNotifierIsExpanded.value != isExpanded) {
      setState(() {
        MyApp.valueNotifierIsExpanded.value = isExpanded;
      });
    }
  }
}
