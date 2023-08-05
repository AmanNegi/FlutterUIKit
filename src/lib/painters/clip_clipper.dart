import 'package:flutter/material.dart';

class ClipClipper extends CustomClipper<Path> {
  double size = 1.25;

  ClipClipper(this.size);

  @override
  Path getClip(Size size) {
    var x = size.width;
    var y = size.height;
    Path newPath = Path()
      ..moveTo(0, 0)
      ..lineTo(0, y)
      ..lineTo(x, y)
      ..lineTo(x, 0)
      ..addOval(Rect.fromCircle(
          center: Offset(0.0, size.height / 1.25), radius: 30.0))
      ..addOval(Rect.fromCircle(
          center: Offset(size.width, size.height / 1.25), radius: 30.0));

    return newPath;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
