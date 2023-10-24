import 'package:flutter/material.dart';

class BookPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var x = size.width;
    var y = size.height;

    Paint paint = new Paint()
      ..color = Color(0xFFecf5fe)
      ..maskFilter = MaskFilter.blur(BlurStyle.solid, 20);

    Path path = new Path()
      ..moveTo(0, 0)
      ..lineTo(x * 0.3, 0)
      ..lineTo(x * 0.3, y)
      ..lineTo(0, y)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
