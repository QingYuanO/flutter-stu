import 'package:flutter/material.dart';

class IntroduceListWidget extends StatelessWidget {
  const IntroduceListWidget({Key key, this.options}) : super(key: key);

  final List<Map> options;
  @override
  Widget build(BuildContext context) {
    Color color = Theme.of(context).primaryColor;
    return ListView.builder(
        itemCount: options.length,
        itemBuilder: (content, index) {
          return Container(
            margin: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
            constraints: BoxConstraints(),
            foregroundDecoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
            ),
            decoration: BoxDecoration(boxShadow: [
              //卡片阴影
              BoxShadow(
                  color: Colors.grey, offset: Offset(2.0, 2.0), blurRadius: 4.0)
            ]),
            child: ListTile(
              shape: CircleBorder(),
              dense: true,
              contentPadding: EdgeInsets.all(8),
              title: Text(
                options[index]['title'],
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
              subtitle: Text(
                options[index]['subTitle'],
                style: TextStyle(color: Colors.grey[300]),
              ),
              trailing: Icon(
                Icons.arrow_forward_ios_outlined,
                color: Colors.white,
              ),
              tileColor: color,
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (content) => options[index]['router'])),
            ),
          );
        });
  }
}
