import 'package:flutter/material.dart';

class GeometricTwoWidget extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint();
    Path path = Path();

    // Path number 1

    paint.color = const Color(0xFF45B3EC);
    path = Path();
    path.lineTo(size.width * 0.01, size.height);
    path.cubicTo(size.width * 0.01, size.height, size.width * 0.89,
        size.height / 2, size.width * 0.89, size.height / 2);
    path.cubicTo(size.width * 1.22, size.height * 0.31, size.width * 0.86,
        size.height * 0.08, size.width * 0.09, size.height * 0.01);
    path.cubicTo(size.width * 0.09, size.height * 0.01, size.width * 0.01, 0,
        size.width * 0.01, 0);
    path.cubicTo(size.width * 0.01, 0, size.width * 0.01, size.height,
        size.width * 0.01, size.height);
    path.cubicTo(size.width * 0.01, size.height, size.width * 0.01, size.height,
        size.width * 0.01, size.height);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
