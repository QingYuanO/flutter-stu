import 'package:flutter/material.dart';

class AlignPage extends StatefulWidget {
  AlignPage({Key key}) : super(key: key);

  @override
  _AlignPageState createState() => _AlignPageState();
}

class _AlignPageState extends State<AlignPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Align'),
      ),
      body: Container(
        width: 120.0,
        height: 120.0,
        color: Colors.blue[50],
        child: Align(
          alignment: Alignment.topRight,
          child: FlutterLogo(),
        ),
      ),
    );
  }
}
