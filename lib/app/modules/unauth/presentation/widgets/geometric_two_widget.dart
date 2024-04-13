import 'package:flutter/material.dart';

class GeometricThreeWidget extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint();
    Path path = Path();

    // Path number 1

    paint.color = const Color(0xFF45B3EC);
    path = Path();
    path.lineTo(size.width * 0.28, 0);
    path.cubicTo(size.width * 0.28, 0, size.width * 0.03, size.height * 0.44,
        size.width * 0.03, size.height * 0.44);
    path.cubicTo(-0.04, size.height * 0.56, size.width * 0.03,
        size.height * 0.69, size.width * 0.18, size.height * 0.74);
    path.cubicTo(size.width * 0.18, size.height * 0.74, size.width, size.height,
        size.width, size.height);
    path.cubicTo(size.width, size.height, size.width, 0, size.width, 0);
    path.cubicTo(size.width, 0, size.width * 0.28, 0, size.width * 0.28, 0);
    path.cubicTo(
        size.width * 0.28, 0, size.width * 0.28, 0, size.width * 0.28, 0);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
