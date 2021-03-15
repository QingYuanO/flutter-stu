import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/introduce_list.dart';
import 'package:flutter_application_1/pages/layout_components/wrap.dart';

class LayoutComponentsPage extends StatelessWidget {
  LayoutComponentsPage({Key key}) : super(key: key);
  final options = <Map>[
    {
      'title': 'Wrap',
      'subTitle': '在使用Row 和 Colum 时，如果子 widget 超出屏幕范围，则会报溢出错误，这时就要用Wrap Widget',
      'router': WrapPage(),
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("布局组件"),
      ),
      body: IntroduceListWidget(options: options),
    );
  }
}
