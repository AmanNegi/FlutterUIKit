import 'package:flutter_30_days/painters/radial_painter.dart';
import 'package:flutter/material.dart';
import '../layout/back_layout.dart';
import 'package:google_fonts/google_fonts.dart';
import '../helper/hex_code.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'dart:math';

class ProgressPage extends StatefulWidget {
  static const String route = "/ProgressPage";
  @override
  _ProgressPageState createState() => _ProgressPageState();
}

Color color1 = HexColor("#5aa1fb");
Color color2 = HexColor("#356bcb");

class _ProgressPageState extends State<ProgressPage>
    with SingleTickerProviderStateMixin {
  late double height, width;

  late AnimationController _animationController;
  late Animation<double> _progressAnimation;

  final Duration fillDuration = Duration(milliseconds: 500);

  double progressDegrees = 0;
  var count = 0;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: fillDuration);

    _progressAnimation = Tween(begin: 0.0, end: 0.25).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeIn),
    );
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      height = constraints.maxHeight;
      width = constraints.maxWidth;
      return Theme(
        data: ThemeData(
          iconTheme: IconThemeData(color: Colors.white),
          fontFamily: GoogleFonts.poppins().fontFamily,
          textTheme: TextTheme(
            bodyText1: TextStyle(color: Colors.white),
            bodyText2: TextStyle(color: Colors.white),
          ),
        ),
        child: Scaffold(
          body: _buildBody(),
        ),
      );
    });
  }

  _buildBody() {
    return BackLayout(
      size: Size(width, height),
      child: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [color1, color2]),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 0.05 * height),
              Padding(
                padding:
                    const EdgeInsets.only(left: 15.0, top: 10.0, bottom: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Dining Room",
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.w800),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "You can access your Dining room\ndevices from any room",
                      style: TextStyle(color: Colors.white60),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              _buildDevicesRow(),
              SizedBox(height: 0.1 * height),
              _buildAnimatedBuilder(),
              SizedBox(height: 0.1 * height),
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Text("Electric Usage"),
              ),
              Container(
                height: 0.2 * height,
                child: ListView(
                  padding: EdgeInsets.all(15.0),
                  scrollDirection: Axis.horizontal,
                  children: [
                    _buildUsageItem(MdiIcons.deskLamp, false),
                    _buildUsageItem(MdiIcons.routerNetwork, true),
                    _buildUsageItem(MdiIcons.airConditioner, true),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _buildUsageItem(IconData icon, bool isOn) {
    return Container(
      margin: EdgeInsets.only(right: 10.0),
      width: 0.35 * width,
      decoration: BoxDecoration(
        color: isOn ? Colors.white : color1,
        borderRadius: BorderRadius.circular(15.0),
      ),
      padding: EdgeInsets.all(0.025 * width),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                icon,
                color: isOn ? Colors.black : Colors.white,
              ),
              Spacer(),
              !isOn
                  ? Icon(
                      MdiIcons.toggleSwitchOff,
                    )
                  : Icon(
                      MdiIcons.circle,
                      color: Colors.red,
                      size: 10,
                    )
            ],
          ),
          Spacer(),
          Text(
            "${Random().nextInt(100)} %",
            style: TextStyle(
                fontSize: 30, color: isOn ? Colors.black : Colors.white),
          ),
        ],
      ),
    );
  }

  _buildDevicesRow() {
    return Row(
      children: [
        SizedBox(width: 15),
        Icon(MdiIcons.airConditioner),
        SizedBox(width: 5),
        Text("Air"),
        Spacer(),
        Icon(MdiIcons.router),
        SizedBox(width: 5),
        Text("Router"),
        Spacer(),
        Icon(MdiIcons.lamp),
        SizedBox(width: 5),
        Text("Lamp"),
        SizedBox(width: 15),
      ],
    );
  }

  _buildAnimatedBuilder() {
    return AnimatedBuilder(
      animation: _progressAnimation,
      builder: (context, child) {
        return Center(
          child: CustomPaint(
            child: Container(
              height: 0.275 * height,
              width: 0.275 * height,
              decoration: BoxDecoration(
                color: Colors.white10,
                shape: BoxShape.circle,
              ),
              padding: EdgeInsets.all(16.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: RichText(
                    text: TextSpan(
                        style: Theme.of(context).textTheme.bodyText1,
                        children: [
                          TextSpan(
                              text: '26',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 40)),
                          WidgetSpan(
                            child: Transform.translate(
                              offset: const Offset(2, -20),
                              child: Text(
                                '°C',
                                //superscript is usually smaller in size
                                textScaleFactor: 0.7,

                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ]),
                  ),
                ),
              ),
            ),
            painter: RadialPainter(_progressAnimation.value * 360.0),
          ),
        );
      },
    );
  }
}
