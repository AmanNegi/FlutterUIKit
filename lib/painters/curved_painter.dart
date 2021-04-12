import 'package:flutter_30_days/helper/hex_code.dart';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class CurvedPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var x = size.width;
    var y = size.height;

    Paint paint = new Paint()
      ..shader = ui.Gradient.linear(
        Offset(0 ,0),
        Offset(x, 0),
        [
          HexColor("#8ede93"),
          HexColor("#4ac6ac")
        ],
      )
      ..maskFilter = MaskFilter.blur(BlurStyle.solid, 20);
    Path path = new Path()
      ..moveTo(0, 0)
      ..lineTo(0, 0.28 * y)
      ..quadraticBezierTo(x * 0.025, y * 0.30, x * 0.05, y * 0.30)
      ..lineTo(x * 0.95, y * 0.30)
      ..quadraticBezierTo(x * 0.975, y * 0.30, x, y * 0.28)
      ..lineTo(x, 0)
      ..close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
