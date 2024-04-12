import 'package:flutter/material.dart';

class UnauthLoginPage extends StatelessWidget {
  const UnauthLoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Container(
              color: const Color(0xFF44B3ED),
              child: const Center(
                child: Text(
                  'LOGO',
                  style: TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ),
          Container(
            color: const Color(0xFF44B3ED),
            child: CustomPaint(
              size: Size(width, height / 4.7.toDouble()),
              painter: MyPainter(),
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.white,
              child: const Center(
                child: Text(
                  'Clip Path Example',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint();
    Path path = Path();

    paint.color = Colors.white;
    path = Path();
    path.lineTo(0, size.height);
    path.cubicTo(0, size.height, 0, size.height, 0, size.height);
    path.cubicTo(0, size.height, size.width * 0.11, size.height * 0.3,
        size.width * 0.115, size.height * 0.3);
    path.cubicTo(size.width * 0.16, size.height * 0.04, size.width * 0.27,
        -0.07, size.width * 0.335, size.height * 0.04);
    path.cubicTo(size.width * 0.37, size.height * 0.05, size.width * 0.89,
        size.height * 0.66, size.width * 0.89, size.height * 0.66);
    path.cubicTo(size.width * 0.95, size.height * 0.72, size.width,
        size.height * 0.85, size.width, size.height);
    path.cubicTo(size.width, size.height, 0, size.height, 0, size.height);
    path.cubicTo(0, size.height, 0, size.height, 0, size.height);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
