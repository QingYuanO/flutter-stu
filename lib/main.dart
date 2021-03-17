import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/introduce_list.dart';
import 'package:flutter_application_1/pages/layout_components/index.dart';
import 'package:flutter_application_1/pages/login.dart';
import 'package:flutter_application_1/pages/me.dart';
import 'package:flutter_application_1/pages/state_manager/index.dart';
import 'package:flutter_application_1/pages/will_pop_scope.dart';

import 'pages/chip_demo.dart';
import 'pages/frosted.dart';

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
      'title': '布局组件',
      'subTitle': '介绍一系列的布局组件',
      'router': LayoutComponentsPage(),
    },
    {
      'title': '登录界面',
      'subTitle': '编写一个静态的登录界面',
      'router': Login(),
    },
    {
      'title': 'WillPopScope',
      'subTitle': '阻止返回',
      'router': WillPopScopePage(),
    },
    {
      'title': '我的界面',
      'subTitle': '静态的我的页面',
      'router': MePage(),
    },
    {
      'title': '毛玻璃效果',
      'subTitle': '毛玻璃效果',
      'router': FrostedDemo(),
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
