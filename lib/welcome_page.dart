import 'package:flutter/material.dart';
import 'package:mdi/mdi.dart';
import 'package:google_fonts/google_fonts.dart';
import 'helper/hex_code.dart';
import 'dart:async';
import 'dart:ui' as ui;

class WelcomePage extends StatefulWidget {
  static const String route = "/WelcomePage";
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage>
    with TickerProviderStateMixin {
  AnimationController controller;
  Animation buttonAnimation,
      textAnimation,
      painterAnimation,
      positionAnimation,
      fadeTextAnimation;

  double height, width;

  bool showWelcomeText = false;

  @override
  void initState() {
    controller = AnimationController(
        vsync: this, duration: Duration(seconds: 2, milliseconds: 500));

    // buttonAnimation =
    //     Tween<double>(begin: 1.0, end: 0.0).animate(CurvedAnimation(
    //   parent: controller,
    //   curve: Interval(0.0, 0.25, curve: Curves.easeInOut),
    // ));

    painterAnimation =
        Tween<double>(begin: 0.0, end: 12.0).animate(CurvedAnimation(
      parent: controller,
      curve: Interval(0.25, 0.5, curve: Curves.easeInOut),
    ));

    textAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
      parent: controller,
      curve: Interval(0.4, 0.6, curve: Curves.easeInOut),
    ));

    positionAnimation =
        Tween<double>(begin: 0.5, end: 0.3).animate(CurvedAnimation(
      parent: controller,
      curve: Interval(0.625, 0.7, curve: Curves.easeInOut),
    ));

    fadeTextAnimation =
        Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
      parent: controller,
      curve: Interval(0.7, 0.8, curve: Curves.easeInOut),
    ));

    super.initState();

    controller.addListener(() {
      setState(() {});
    });

    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: Colors.black,
        body: CustomPaint(
          painter: CurvePainter(painterAnimation.value),
          child: Stack(
            children: [
              // Container(
              //   height: height,
              //   width: width,
              //   child: Column(
              //     children: [
              //       Spacer(),
              //       Opacity(
              //         opacity: buttonAnimation.value,
              //         child: GestureDetector(
              //           onTap: () => controller.forward(),
              //           child: Container(
              //             height: 0.075 * height,
              //             width: 0.6 * width,
              //             decoration: BoxDecoration(
              //               borderRadius: BorderRadius.circular(15.0),
              //               gradient: LinearGradient(
              //                 colors: [
              //                   HexColor("#f17568"),
              //                   HexColor("#e94c3d"),
              //                 ],
              //               ),
              //             ),
              //             child: Center(
              //               child: Text(
              //                 "Let's start",
              //                 style:
              //                     TextStyle(color: Colors.white, fontSize: 20),
              //               ),
              //             ),
              //           ),
              //         ),
              //       ),
              //       Spacer()
              //     ],
              //   ),
              // ),
              textAnimation.value > 0.0
                  ? Positioned(
                      top: positionAnimation.value * height,
                      left: 0,
                      right: 0,
                      child: Opacity(
                        opacity: textAnimation.value,
                        child: Container(
                          child: Center(
                            child: Text(
                              "Welcome",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                                fontSize: 30,
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  : Container(),
              fadeTextAnimation.value > 0
                  ? Positioned(
                      top: 0.4 * height,
                      left: 0.1 * width,
                      right: 0.1 * width,
                      child: Opacity(
                        opacity: fadeTextAnimation.value,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                                "This app is a collection of all the pages made by me in the 3o days of flutter challenge. Hope you like it!. The source code is available on Github.",
                                style: TextStyle(color: Colors.white),
                                textAlign: TextAlign.center),
                            SizedBox(height: 10),
                            GestureDetector(
                              onTap: () {
                                controller.reverse().then((value) {
                                  Navigator.of(context).pushNamed("/NavigatorPage");
                                });
                              },
                              child: Container(
                                height: 0.075 * height,
                                width: 0.6 * width,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15.0),
                                    color: Colors.white.withOpacity(0.25)),
                                child: Center(
                                  child: Text(
                                    "Let's start",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  : Container(),
            ],
          ),
        ));
  }
}

class CurvePainter extends CustomPainter {
  double ratio = 1;

  CurvePainter(this.ratio);
  @override
  void paint(Canvas canvas, Size size) {
    double x = size.width;
    double y = size.height;

    Path path = new Path()
      ..moveTo(0, 0)
      ..quadraticBezierTo(x * 0.4, (y * 0.25) * ratio, x, (y * 0.275) * ratio)
      ..lineTo(x, 0)
      ..lineTo(0, 0)
      ..close();

    Path path2 = new Path()
      ..moveTo(0, 0)
      ..moveTo(0, y)
      ..lineTo(x, y)
      ..lineTo(x, y * 0.8)
      ..quadraticBezierTo(x * 0.5, (y * 0.6) / ratio, 0, (y * 0.675) / ratio)
      ..lineTo(0, y)
      ..close();

    Paint paint1 = new Paint()
      ..shader = ui.Gradient.linear(
        Offset(0, 0),
        Offset(0, y * 0.275),
        [
          HexColor("#f17568"),
          HexColor("#e67b6e"),
        ],
      );

    Paint paint2 = new Paint()
      ..shader = ui.Gradient.linear(
        Offset(x, y),
        Offset(0, y * 0.675),
        [
          HexColor("#e67b6e"),
          HexColor("#e94c3d"),
        ],
      );
    canvas.drawPath(path, paint1);

    canvas.drawPath(path2, paint2);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
