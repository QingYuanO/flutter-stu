import 'package:flutter/material.dart';

class FadeInFadeOutBox extends StatefulWidget {
  FadeInFadeOutBox({Key key}) : super(key: key);

  @override
  _FadeInFadeOutBoxState createState() => _FadeInFadeOutBoxState();
}

class _FadeInFadeOutBoxState extends State<FadeInFadeOutBox> {
  bool _visible = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('淡入淡出'),
      ),
      body: Center(
        child: AnimatedOpacity(
          opacity: _visible ? 1 : 0,
          duration: Duration(milliseconds: 500),
          child: Container(
            width: 200.0,
            height: 200.0,
            color: Colors.green,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Call setState. This tells Flutter to rebuild the
          // UI with the changes.
          setState(() {
            _visible = !_visible;
          });
        },
        tooltip: 'Toggle Opacity',
        child: Icon(Icons.flip),
      ),
    );
  }
}
