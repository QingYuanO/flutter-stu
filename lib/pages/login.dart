import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  Login({Key key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController _unameController = TextEditingController();
  TextEditingController _psdController = TextEditingController();

  String _psd = '';
  String _account = '';

  @override
  void initState() {
    _unameController.addListener(() {
      setState(() {
        _account = _unameController.text;
      });
    });
    _psdController.addListener(() {
      setState(() {
        _psd = _psdController.text;
      });
    });
    super.initState();
  }

  void commit() {
    print(_unameController.text);
    print(_psdController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('登录'),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          children: [
            TextField(
              controller: _unameController, //设置controller
              decoration: InputDecoration(
                  labelText: "用户名",
                  hintText: "用户名或邮箱",
                  prefixIcon: Icon(Icons.person)),
            ),
            TextField(
              controller: _psdController, //设置controller
              decoration: InputDecoration(
                  labelText: "密码",
                  hintText: "您的登录密码",
                  prefixIcon: Icon(Icons.lock)),
              obscureText: true,
            ),
            Padding(
              padding: EdgeInsets.only(top: 8),
              child: ElevatedButton(
                style: ButtonStyle(
                    elevation: MaterialStateProperty.all(5),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25))),
                    minimumSize:
                        MaterialStateProperty.all(Size.fromHeight(50))),
                child: Text('提交'),
                onPressed: commit,
              ),
            ),
            Row(
              children: [
                Text(_account),
                Text(_psd),
              ],
            )
          ],
        ),
      ),
    );
  }
}
