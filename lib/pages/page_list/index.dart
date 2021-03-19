import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/introduce_list.dart';
import 'package:flutter_application_1/pages/frosted.dart';
import 'package:flutter_application_1/pages/page_list/login.dart';
import 'package:flutter_application_1/pages/page_list/me.dart';

class PagelistDemoPage extends StatefulWidget {
  PagelistDemoPage({Key key}) : super(key: key);

  @override
  _PagelistDemoPageState createState() => _PagelistDemoPageState();
}

class _PagelistDemoPageState extends State<PagelistDemoPage> {
  final options = <Map>[
    {
      'title': '登录界面',
      'subTitle': '编写一个静态的登录界面',
      'router': Login(),
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
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('页面'),
        ),
        body: IntroduceListWidget(
          options: options,
        ));
  }
}
