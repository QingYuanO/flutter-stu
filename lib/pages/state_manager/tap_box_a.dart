import 'package:flutter/material.dart';

class TapboxAState extends StatefulWidget {
  TapboxAState({Key key}) : super(key: key);

  @override
  _TapboxAStateState createState() => _TapboxAStateState();
}

class _TapboxAStateState extends State<TapboxAState> {
  bool _active = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: GestureDetector(
          onTap: () {
            setState(() {
              _active = !_active;
            });
          },
          child: Container(
            child: Center(
              child: Text(
                _active ? 'Active' : 'Inactive',
                style: TextStyle(fontSize: 32.0, color: Colors.white),
              ),
            ),
            width: 200.0,
            height: 200.0,
            decoration: BoxDecoration(
              color: _active ? Colors.lightGreen[700] : Colors.grey[600],
            ),
          ),
        ),
      ),
    );
  }
}
