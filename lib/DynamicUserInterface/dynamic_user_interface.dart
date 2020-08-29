import 'package:flutter/material.dart';
import 'package:learn_flu/DynamicUserInterface/contain/grid_view.dart';
import 'package:learn_flu/DynamicUserInterface/contain/list_view.dart';
import 'package:learn_flu/config_size.dart';

class DynamicUserInterface extends StatefulWidget {
  @override
  _DynamicUserInterfaceState createState() => _DynamicUserInterfaceState();
}

class _DynamicUserInterfaceState extends State<DynamicUserInterface>
    with TickerProviderStateMixin {
  List<Widget> listTabBar = [
    Tab(text: 'List View'),
    Tab(text: 'Grid View'),
  ];

  List<Widget> listTabView = [
    ListViewDUI(),
    GridViewDUI(),
  ];

  TabController controller;

  @override
  void initState() {
    controller = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ConfigSize.setSize(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Dynamic User Interface'),
        bottom: TabBar(controller: controller, tabs: listTabBar),
      ),
      body: TabBarView(controller: controller, children: listTabView),
    );
  }
}
