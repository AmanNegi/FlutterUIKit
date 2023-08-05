import 'package:flutter/material.dart';

import 'dart:ui' as ui;

// Animated Painter that appears at the start screen

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

    const Color color1 = Color(0xFF713FFE);
    const Color color2 = Color(0xFF9B38FE);

    Paint paint1 = new Paint()
      ..shader = ui.Gradient.linear(
        Offset(0, 0),
        Offset(0, y * 0.275),
        [
          // Color(0xFFf17568),
          // Color(0xFFe67b6e),
          color1, color2,
        ],
      );

    Paint paint2 = new Paint()
      ..shader = ui.Gradient.linear(
        Offset(x, y),
        Offset(0, y * 0.675),
        [
          color2, color1,
          // Color(0xFFe67b6e),
          // Color(0xFFe94c3d),
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
