import 'package:flutter/material.dart';
import '../helper/hex_code.dart';

import 'dart:ui' as ui;

class WelcomePainter extends CustomPainter {
  double ratio = 1;

  WelcomePainter(this.ratio);
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
