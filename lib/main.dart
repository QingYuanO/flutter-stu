import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/introduce_list.dart';
import 'package:flutter_application_1/pages/animations/index.dart';
import 'package:flutter_application_1/pages/effects/index.dart';
import 'package:flutter_application_1/pages/functional_components/Inherited.dart';
import 'package:flutter_application_1/pages/layout_components/index.dart';
import 'package:flutter_application_1/pages/page_list/index.dart';
import 'package:flutter_application_1/pages/state_manager/index.dart';
import 'package:flutter_application_1/pages/week_components/index.dart';
import 'package:flutter_application_1/pages/will_pop_scope.dart';

import 'pages/chip_demo.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '首页',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final options = <Map>[
    {
      'title': '界面',
      'subTitle': '静态的页面',
      'router': PagelistDemoPage(),
    },
    {
      'title': '布局组件',
      'subTitle': '介绍一系列的布局组件',
      'router': LayoutComponentsPage(),
    },
    {
      'title': 'WillPopScope',
      'subTitle': '阻止返回',
      'router': WillPopScopePage(),
    },
    {
      'title': 'ChipDemo',
      'subTitle': 'ChipDemo',
      'router': ChipDemoPage(),
    },
    {
      'title': '状态管理',
      'subTitle': 'Flutter实战 状态管理',
      'router': StateManagerPage(),
    },
    {
      'title': '数据共享(InheritedWidget)',
      'subTitle': '数据共享(InheritedWidget)',
      'router': InheritedWidgetTestRoute(),
    },
    {
      'title': 'Animations',
      'subTitle': '动画效果',
      'router': AnimationComponentsPage(),
    },
    {
      'title': 'Effects',
      'subTitle': '异步操作等副作用',
      'router': EffectsPage(),
    },
    {
      'title': '每周widget',
      'router': WeekComponentsPage(),
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: IntroduceListWidget(options: options));
  }
}
