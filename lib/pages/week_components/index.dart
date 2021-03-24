import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/introduce_list.dart';
import 'package:flutter_application_1/pages/week_components/sliver_appbar_demo.dart';

class WeekComponentsPage extends StatefulWidget {
  WeekComponentsPage({Key key}) : super(key: key);

  @override
  _WeekComponentsPageState createState() => _WeekComponentsPageState();
}

class _WeekComponentsPageState extends State<WeekComponentsPage> {
  final options = <Map>[
    {
      'title': 'SliverAppBar',
      'router': SliverAppBarDemo(),
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('每周组件'),
        ),
        body: IntroduceListWidget(
          options: options,
        ));
  }
}
