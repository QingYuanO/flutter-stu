import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/introduce_list.dart';
import 'package:flutter_application_1/pages/layout_components/index.dart';

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
