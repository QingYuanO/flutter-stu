import 'package:flutter/material.dart';

class StateManagerPage extends StatefulWidget {
  StateManagerPage({Key key}) : super(key: key);

  @override
  _StateManagerPageState createState() => _StateManagerPageState();
}

class _StateManagerPageState extends State<StateManagerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('状态管理'),
      ),
      body: Center(
        child: Text('manager'),
      ),
    );
  }
}
