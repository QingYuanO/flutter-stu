import 'package:flutter/material.dart';

class FilterSelector extends StatefulWidget {
  FilterSelector({Key key}) : super(key: key);

  @override
  _FilterSelectorState createState() => _FilterSelectorState();
}

class _FilterSelectorState extends State<FilterSelector> {
  static const _filtersPerScreen = 5;
  static const _viewportFractionPerItem = 1.0 / _filtersPerScreen;
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      final itemSize = constraints.maxWidth * _viewportFractionPerItem;
      return Stack(
        alignment: Alignment.bottomCenter,
        children: [],
      );
    });
  }
}
