import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/introduce_list.dart';

import 'tap_box_a.dart';
import 'tap_box_b.dart';

class StateManagerPage extends StatefulWidget {
  StateManagerPage({Key key}) : super(key: key);

  @override
  _StateManagerPageState createState() => _StateManagerPageState();
}

class _StateManagerPageState extends State<StateManagerPage> {
  final options = <Map>[
    {
      'title': 'Widget管理自身状态',
      'subTitle': 'Widget管理自身状态',
      'router': TapboxAState(),
    },
    {
      'title': '父Widget管理子Widget的状态',
      'subTitle': '类似于react的把属性和更改属性的方法传递下去',
      'router': TapBoxBState(),
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('状态管理'),
        ),
        body: IntroduceListWidget(
          options: options,
        ));
  }
}
