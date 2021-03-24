import 'package:flutter/material.dart';

class SliverAppBarDemo extends StatefulWidget {
  SliverAppBarDemo({Key key}) : super(key: key);

  @override
  _SliverAppBarDemoState createState() => _SliverAppBarDemoState();
}

class _SliverAppBarDemoState extends State<SliverAppBarDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            // title: Text("标题"),
            expandedHeight: 230.0,
            floating: false,
            pinned: true,
            snap: false,
            actions: [
              IconButton(
                icon: Icon(Icons.add),
              ),
              IconButton(
                icon: Icon(Icons.more_horiz),
              ),
            ],
            flexibleSpace: FlexibleSpaceBar(
              title: Text('比气体'),
              centerTitle: true,
              collapseMode: CollapseMode.pin,
            ),
          ),
          SliverFixedExtentList(
              delegate: SliverChildBuilderDelegate(
                  (context, index) => ListTile(
                        title: Text("Item $index"),
                      ),
                  childCount: 30),
              itemExtent: 50.0)
        ],
      ),
    );
  }
}
