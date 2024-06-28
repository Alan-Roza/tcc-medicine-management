import 'package:flutter/material.dart';

class GeometricOneWidget extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint();
    Path path = Path();

    // Path number 1
    paint.color = const Color(0xff5BC6FE);
    path = Path();
    path.lineTo(size.width * 0.55, 0);
    path.cubicTo(size.width * 0.55, 0, size.width * 0.06, size.height * 0.5,
        size.width * 0.08, size.height * 0.49);
    path.cubicTo(-0.09, size.height * 0.64, size.width * 0.07,
        size.height * 0.80, size.width * 0.41, size.height * 0.89);
    path.cubicTo(size.width * 0.41, size.height * 0.89, size.width, size.height,
        size.width, size.height);
    path.cubicTo(size.width, size.height, size.width, 0, size.width, 0);
    path.cubicTo(size.width, 0, size.width * 0.55, 0, size.width * 0.55, 0);
    path.cubicTo(
        size.width * 0.55, 0, size.width * 0.55, 0, size.width * 0.55, 0);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
