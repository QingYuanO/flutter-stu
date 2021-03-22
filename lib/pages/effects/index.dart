import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/introduce_list.dart';
import 'package:flutter_application_1/pages/effects/download_button.dart';

class EffectsPage extends StatelessWidget {
  EffectsPage({Key key}) : super(key: key);
  final options = <Map>[
    {
      'title': '创建一个下载按钮',
      'router': DownloadButtonDemo(),
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Effects"),
      ),
      body: IntroduceListWidget(options: options),
    );
  }
}
