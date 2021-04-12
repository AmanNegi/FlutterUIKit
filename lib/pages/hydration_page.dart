import 'package:flutter/material.dart';
import '../helper/hex_code.dart';
import 'dart:math';
import 'package:vector_math/vector_math_64.dart' as math;

import 'package:mdi/mdi.dart';
import 'package:google_fonts/google_fonts.dart';
import '../layout/back_layout.dart';

class HydrationPage extends StatefulWidget {
  static const String route = "/HydrationPage";
  @override
  _HydrationPageState createState() => _HydrationPageState();
}

class _HydrationPageState extends State<HydrationPage> {
  double height, width;
  HexColor mainColor = HexColor("#7e7cf8");
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      width = constraints.maxWidth;
      height = constraints.maxHeight;
      return Theme(
        data: ThemeData(
        primaryColor: mainColor,
          fontFamily: GoogleFonts.montserrat().fontFamily,
        ),
        child: Scaffold(
          body: BackLayout(
            size: Size(width, height),
            child: Column(
              children: [
                SizedBox(height: 0.075 * height),
                Text(
                  "Current Hydration",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Spacer(),
                CustomPaint(
                  painter: RadialPainter(270),
                  child: Container(
                    height: 0.3 * height,
                    width: 0.3 * height,
                    child: Container(
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "84%",
                              style: TextStyle(
                                  fontSize: 37, fontWeight: FontWeight.w900),
                            ),
                            Text("1,290 ml")
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          _buildItem(
                            Mdi.waterOutline,
                            mainColor.withOpacity(0.45),
                          ),
                          SizedBox(width: 10),
                          _buildItem(
                            Mdi.bottleSodaOutline,
                            mainColor.withOpacity(0.3),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          _buildItem(
                            Mdi.cupOutline,
                            mainColor.withOpacity(0.2),
                          ),
                          SizedBox(width: 10),
                          _buildItem(
                            Mdi.bottleTonicOutline,
                            mainColor.withOpacity(0.1),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Spacer(),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(
                        Mdi.waterOutline,
                        size: 30,
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 10.0),
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        child: Icon(
                          Mdi.circleOutline,
                          color: Colors.white,
                        ),
                      ),
                      Icon(
                        Mdi.squareRoundedOutline,
                        size: 30,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 0.025 * height),
              ],
            ),
          ),
        ),
      );
    });
  }

  _buildItem(IconData icon, Color color) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(15.0),
        ),
        padding: EdgeInsets.all(20.0),
        child: Row(
          children: [
            Spacer(),
            Icon(icon),
            SizedBox(width: 10),
            Text(Random().nextInt(1000).toString() + " ml"),
            Spacer(),
          ],
        ),
      ),
    );
  }
}

class RadialPainter extends CustomPainter {
  double progressInDegrees;

  RadialPainter(this.progressInDegrees);

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.grey.withOpacity(0.2)
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = 20.0;

    Offset center = Offset(size.width / 2, size.height / 2);
    canvas.drawCircle(center, size.width / 2, paint);

    Paint progressPaint = Paint()
      ..shader = LinearGradient(colors: [
        HexColor("#7e7cf8"),
        HexColor("#dcddfb"),
      ]).createShader(Rect.fromCircle(center: center, radius: size.width / 2))
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = 20.0;

    canvas.drawArc(
        Rect.fromCircle(center: center, radius: size.width / 2),
        math.radians(-90),
        math.radians(progressInDegrees),
        false,
        progressPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
