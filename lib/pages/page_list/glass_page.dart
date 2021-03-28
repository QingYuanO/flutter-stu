import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/glass_widget.dart';

class GlassmorphicSample extends StatefulWidget {
  GlassmorphicSample({Key key}) : super(key: key);

  @override
  _GlassmorphicSampleState createState() => _GlassmorphicSampleState();
}

class _GlassmorphicSampleState extends State<GlassmorphicSample> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Stack(
          children: [
            Image.asset(
              'assets/bg.jpg',
              fit: BoxFit.cover,
              height: double.infinity,
              width: double.infinity,
              scale: 1,
            ),
            SafeArea(
                child: Center(
              child: GlassWidget(
                width: width * 0.9,
                height: height * 0.92,
                borderRadius: 30,
                blur: 20,
                linearGradientBeginOpacity: 0.3,
                linearGradientEndOpacity: 0.2,
                borderGradientBeginOpacity: 0.5,
                borderGradientEndOpacity: 0.02,
                child: Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 30,
                      ),
                      _buildUser(),
                      _buildInfoes(),
                    ],
                  ),
                ),
              ),
            ))
          ],
        ),
      ),
    );
  }

  Widget _buildUser() {
    Widget _buildName() => Container(
          padding: EdgeInsets.only(left: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "星期五",
                style: TextStyle(
                    color: Color(0xFFeb3c63),
                    fontSize: 30,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 1),
              ),
              Text(
                '波比boy',
                style: TextStyle(
                  color: Color(0xFFef7079),
                  fontSize: 20,
                  letterSpacing: 1,
                  fontWeight: FontWeight.w500,
                ),
              )
            ],
          ),
        );
    Widget _buildPic() => Padding(
          padding: const EdgeInsets.only(right: 15),
          child: Container(
            padding: EdgeInsets.all(5),
            height: 100,
            width: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color(0xFFec445b).withOpacity(0.8),
                    Color(0xFFfbb055).withOpacity(0.8)
                  ]),
            ),
            child: Container(
              width: 90,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/head.jpg'),
                ),
              ),
            ),
          ),
        );
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [_buildName(), _buildPic()],
    );
  }

  Widget _buildInfoes() => Container(
        padding: EdgeInsets.only(top: 30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildInfoItem('身高', ' 180'),
            _buildInfoItem('体重', ' 70'),
            _buildInfoItem('大卡', ' 280')
          ],
        ),
      );

  Widget _buildInfoItem(String desc, String descVal) => GlassWidget(
        width: 100,
        height: 50,
        borderRadius: 5,
        blur: 10,
        linearGradientBeginOpacity: 0.4,
        linearGradientEndOpacity: 0.4,
        borderGradientBeginOpacity: 0.5,
        borderGradientEndOpacity: 0.1,
        child: Center(
          child: RichText(
            text: TextSpan(
              text: desc,
              style: TextStyle(
                color: Color(0xff757575),
                fontSize: 16,
                fontWeight: FontWeight.normal,
              ),
              children: [
                TextSpan(
                  text: descVal,
                  style: TextStyle(
                    color: Color(0xFFe82c5c),
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
          ),
        ),
      );
}
