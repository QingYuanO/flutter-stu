import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/introduce_list.dart';
import 'package:flutter_application_1/pages/animations/container_animations.dart';
import 'package:flutter_application_1/pages/animations/fadein_fadeout_box.dart';
import 'package:flutter_application_1/pages/animations/page_switch_aniamtion.dart';
import 'package:flutter_application_1/pages/animations/physics_card_drag.dart';

class AnimationComponentsPage extends StatelessWidget {
  AnimationComponentsPage({Key key}) : super(key: key);
  final options = <Map>[
    {
      'title': 'Container 里的动画渐变效果',
      'router': ConteinerAnimationPage(),
    },
    {
      'title': 'Widget 的淡入淡出效果',
      'router': FadeInFadeOutBox(),
    },
    {
      'title': 'Widget 的物理模拟动画效果',
      'router': PhysicsCardDragPage(),
    },
    {
      'title': '为页面切换加入动画效果',
      'router': PageA(),
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("动画效果"),
      ),
      body: IntroduceListWidget(options: options),
    );
  }
}
