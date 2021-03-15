import 'package:flutter/material.dart';

class RowAndColumnPage extends StatelessWidget {
  const RowAndColumnPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('RowAndColumn'),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("a"),
              Expanded(
                child: Container(
                  alignment: Alignment.center,
                  child: Text('b'),
                  color: Colors.cyan[400],
                ),
                flex: 1,
              ),
              Text("a"),
              Text("a"),
            ],
          )
        ],
      ),
    );
  }
}
