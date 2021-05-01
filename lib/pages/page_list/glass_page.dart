import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/glass_widget.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

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
                height: height * 0.95,
                borderRadius: 30,
                blur: 20,
                linearGradientBeginOpacity: 0.3,
                linearGradientEndOpacity: 0.2,
                borderGradientBeginOpacity: 0.5,
                borderGradientEndOpacity: 0.02,
                child: Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      _buildUser(),
                      _buildInfoes(),
                      SizedBox(
                        height: 10,
                      ),
                      _buildProgress(),
                      _buildMessage(),
                      _buildWork(),
                      _buildBottom()
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
                    fontSize: 28,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 1),
              ),
              Text(
                '波比boy',
                style: TextStyle(
                  color: Color(0xFFef7079),
                  fontSize: 18,
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
            height: 90,
            width: 90,
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
              width: 80,
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

  Widget _buildProgress() => SleekCircularSlider(
        innerWidget: (double value) {
          return Center(
            child: _buildCenterInfo(),
          );
        },
        appearance: CircularSliderAppearance(
          startAngle: -80,
          angleRange: 400,
          size: 180,
          customColors: CustomSliderColors(
            trackColor: Color(0xffffffff).withOpacity(0.6),
            progressBarColors: [
              Color(0xfffec753),
              Color(0xfff16d58),
            ],
            shadowColor: Color(0xffffffff).withOpacity(0.1),
          ),
          customWidths: CustomSliderWidths(
            progressBarWidth: 20,
            trackWidth: 20,
          ),
        ),
      );

  Widget _buildCenterInfo() => GlassWidget(
      width: 110,
      height: 110,
      borderRadius: 65,
      blur: 10,
      linearGradientBeginOpacity: 0.6,
      linearGradientEndOpacity: 0.4,
      borderGradientBeginOpacity: 0.2,
      borderGradientEndOpacity: 0.05,
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '6550',
              style: TextStyle(
                color: Color(0xfff26a5a).withOpacity(0.9),
                fontSize: 30,
                letterSpacing: -2,
                fontWeight: FontWeight.w700,
              ),
            ),
            Text(
              '步数',
              style: TextStyle(
                color: Color(0xfff79056).withOpacity(0.9),
                fontSize: 15,
                letterSpacing: -2,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ));

  Widget _buildMessage() => Container(
        padding: EdgeInsets.only(top: 15.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildMessageItem('assets/heart.png', '心跳'),
            _buildMessageItem('assets/water.png', '补水'),
            _buildMessageItem('assets/moon.png', '睡眠')
          ],
        ),
      );
  Widget _buildMessageItem(String image, String text) => Center(
        child: GlassWidget(
            width: 100,
            height: 100,
            borderRadius: 10,
            blur: 10,
            linearGradientBeginOpacity: 0.4,
            linearGradientEndOpacity: 0.4,
            borderGradientBeginOpacity: 0.5,
            borderGradientEndOpacity: 0.1,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    image,
                    height: 40,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    text,
                    style: TextStyle(
                        color: Color(0xff535353),
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            )),
      );

  Widget _buildWork() => Container(
        padding: EdgeInsets.only(top: 7),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildWorkItem('assets/workout.png', '健身日程'),
            _buildWorkItem('assets/diet.png', '健康饮食')
          ],
        ),
      );
  Widget _buildWorkItem(String image, String text) => Center(
        child: GlassWidget(
          width: 158,
          height: 55,
          borderRadius: 10,
          blur: 10,
          linearGradientBeginOpacity: 0.4,
          linearGradientEndOpacity: 0.4,
          borderGradientBeginOpacity: 0.5,
          borderGradientEndOpacity: 0.1,
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  image,
                  height: 40,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  text,
                  style: TextStyle(
                      color: Color(0xff535353),
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
      );
  Widget _buildBottom() => Container(
        margin: EdgeInsets.only(top: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: Icon(
                Icons.calendar_today,
                color: Color(0xffe82c5c),
              ),
              onPressed: null,
            ),
            IconButton(
              icon: Icon(Icons.person_outline_outlined),
              onPressed: null,
            ),
            IconButton(
              icon: Icon(Icons.settings_outlined),
              onPressed: null,
            ),
            IconButton(
              icon: Icon(Icons.file_present),
              onPressed: null,
            )
          ],
        ),
      );
}
