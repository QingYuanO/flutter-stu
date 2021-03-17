import 'package:flutter/material.dart';

class ChipDemoPage extends StatefulWidget {
  ChipDemoPage({Key key}) : super(key: key);

  @override
  _ChipDemoPageState createState() => _ChipDemoPageState();
}

class _ChipDemoPageState extends State<ChipDemoPage> {
  bool _isSelected = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('chip demo'),
      ),
      body: Center(
        child: Column(
          children: [
            ActionChip(
                label: Text("ACTION CHIP"),
                onPressed: () {
                  setState(() {
                    Scaffold.of(context)
                        .showSnackBar(SnackBar(content: Text('ON TAP')));
                  });
                }),
            Chip(
              label: Text('CHIP'),
              avatar: CircleAvatar(
                backgroundColor: Colors.grey.shade800,
                child: Text('01'),
              ),
              onDeleted: () {},
            ),
            ChoiceChip(
              label: Text('choice chip'),
              selected: _isSelected,
              onSelected: (isSelected) {
                setState(() {
                  _isSelected = isSelected;
                });
              },
              selectedColor: Colors.blue.shade400,
            ),
          ],
        ),
      ),
    );
  }
}
