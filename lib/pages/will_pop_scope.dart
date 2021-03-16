import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WillPopScopePage extends StatelessWidget {
  const WillPopScopePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('返回阻止'),
      ),
      body: WillPopScope(
          child: Center(
            child: Center(
              child: Column(
                children: [
                  TextButton(
                    child: Text("取消"),
                    style: ButtonStyle(
                        textStyle: MaterialStateProperty.all(
                            TextStyle(color: Colors.grey[400]))),
                  ),
                ],
              ),
            ),
          ),
          onWillPop: () async {
            bool isReturn = await showDeleteConfirmDialog1(context: context);
            return isReturn;
          }),
    );
  }
}

// 弹出对话框
Future<bool> showDeleteConfirmDialog1({context}) {
  return showDialog<bool>(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text("提示"),
        content: Text("你确定要返回吗?"),
        actions: <Widget>[
          TextButton(
            child: Text("取消"),
            style: ButtonStyle(
                textStyle: MaterialStateProperty.all(
                    TextStyle(color: Colors.grey[400]))),
            onPressed: () => Navigator.of(context).pop(false), // 关闭对话框
          ),
          TextButton(
            child: Text("确定"),
            onPressed: () {
              //关闭对话框并返回true
              Navigator.of(context).pop(true);
            },
          ),
        ],
      );
    },
  );
}
