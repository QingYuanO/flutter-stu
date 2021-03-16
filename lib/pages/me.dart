import 'package:flutter/material.dart';

class MePage extends StatelessWidget {
  const MePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color color = Theme.of(context).primaryColor;
    return Scaffold(
      appBar: AppBar(
        title: Text('我的'),
        elevation: 0,
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(24),
            margin: EdgeInsets.only(bottom: 8),
            decoration: BoxDecoration(color: color),
            constraints: BoxConstraints(minWidth: double.infinity),
            child: Column(
              children: [
                CircleAvatar(
                  minRadius: 40.0,
                  child: Text('头像'),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 8),
                  child: Text(
                    '立即登录',
                    style: TextStyle(color: Colors.white),
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey[300],
                      offset: Offset(0.0, 1.0),
                      blurRadius: 2.0)
                ]),
            child: Column(
              children: [
                ListTile(
                  shape: Border.all(
                      color: Colors.yellowAccent,
                      style: BorderStyle.solid,
                      width: 5),
                  title: Text('考试记录'),
                  trailing: Icon(Icons.keyboard_arrow_right_outlined),
                ),
                ListTile(
                  shape: Border(
                      bottom: BorderSide(
                          color: Colors.grey[500],
                          width: 2,
                          style: BorderStyle.solid)),
                  title: Text('学习记录'),
                  trailing: Icon(Icons.keyboard_arrow_right_outlined),
                ),
                ListTile(
                  title: Text('账号及安全'),
                  trailing: Icon(Icons.keyboard_arrow_right_outlined),
                ),
                ListTile(
                  title: Text('客服帮助'),
                  trailing: Icon(Icons.keyboard_arrow_right_outlined),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
