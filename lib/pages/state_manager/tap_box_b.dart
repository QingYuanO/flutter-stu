import 'package:flutter/material.dart';

class TapBoxBState extends StatefulWidget {
  TapBoxBState({Key key}) : super(key: key);

  @override
  _TapBoxBStatState createState() => _TapBoxBStatState();
}

class _TapBoxBStatState extends State<TapBoxBState> {
  bool _active = false;
  void _handleTapboxChanged(bool newValue) {
    setState(() {
      _active = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ChildStatePage(
      active: _active,
      onChanged: _handleTapboxChanged,
    );
  }
}

class ChildStatePage extends StatelessWidget {
  ChildStatePage({Key key, this.active: false, @required this.onChanged})
      : super(key: key);
  final bool active;
  final ValueChanged<bool> onChanged;
  void _handleTap() {
    onChanged(!active);
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: GestureDetector(
          onTap: _handleTap,
          child: Container(
            child: Center(
              child: Text(
                active ? 'Active' : 'Inactive',
                style: TextStyle(fontSize: 32.0, color: Colors.white),
              ),
            ),
            width: 200.0,
            height: 200.0,
            decoration: BoxDecoration(
              color: active ? Colors.lightGreen[700] : Colors.grey[600],
            ),
          ),
        ),
      ),
    );
  }
}
