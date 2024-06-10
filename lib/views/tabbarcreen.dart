import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:walmart/controller/homecontroller.dart';
import 'package:walmart/views/categoryscreen.dart';
import 'package:walmart/views/homescreen.dart';
import 'package:walmart/views/likescreen.dart';
import 'package:walmart/views/searchimg.dart';

class TabbarScreen extends StatefulWidget {
  const TabbarScreen({super.key});

  @override
  State<TabbarScreen> createState() => _TabbarScreenState();
}

class _TabbarScreenState extends State<TabbarScreen> {
  final homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Wallmart"),
          centerTitle: true,
          bottom: TabBar(
            indicatorColor: Colors.transparent,
            labelColor: Colors.white,
            dividerColor: Colors.transparent,
            unselectedLabelColor: const Color.fromRGBO(94, 94, 94, 1),
            indicatorSize: TabBarIndicatorSize.label,
            splashBorderRadius: BorderRadius.circular(20),
            tabs: const <Widget>[
              Tab(
                icon: Icon(CupertinoIcons.home),
              ),
              Tab(
                icon: Icon(Icons.category_outlined),
              ),
              Tab(
                icon: Icon(Icons.search_rounded),
              ),
              Tab(
                icon: Icon(Icons.grade_outlined),
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: <Widget>[
            HomeScreen(),
            category_Screen(),
            SearchImg(),
            like_Screen(),
          ],
        ),
      ),
    );
  }
}
