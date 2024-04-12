import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

class UnauthHomePage extends StatelessWidget {
  const UnauthHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color(0xFF44B3ED),
      body: Column(
        children: [
          Expanded(
            child: Container(
              color: const Color(0xFF44B3ED),
              child: const Center(
                child: Text(
                  'HOME LOGO',
                  style: TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: height / 5.toDouble(), // Set this to a suitable value
            child: Stack(
              children: [
                Positioned(
                  top: -1,
                  bottom: -1,
                  left: 0,
                  right: 0,
                  child: Container(
                    color: const Color(0xFF44B3ED),
                    child: CustomPaint(
                      size: Size(width, height / 5.toDouble()),
                      painter: MyPainter(),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: SizedBox(
              // Set this to a suitable value
              child: Stack(
                children: [
                  Positioned(
                    top: -1,
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      padding: const EdgeInsetsDirectional.only(
                        start: 20,
                        end: 20,
                      ),
                      width: MediaQuery.of(context).size.width * 0.75,
                      color: Colors.white,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          LayoutBuilder(
                            builder: (BuildContext context,
                                BoxConstraints constraints) {
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'bem-vindo ao tcc \no seu assistente médico!'
                                        .toUpperCase(),
                                    style: const TextStyle(
                                        fontSize: 22,
                                        fontFamily:
                                            'Roboto', // Set the font family to Roboto
                                        fontWeight: FontWeight.w500,
                                        height: 1.2),
                                  ),
                                  Container(
                                    width: constraints.maxWidth / 5,
                                    height: 6,
                                    margin: const EdgeInsets.only(top: 5),
                                    decoration: BoxDecoration(
                                      color: const Color(0xFF00A8FF),
                                      border: Border.all(
                                        color: const Color(
                                            0xFF00A8FF), // Set border color
                                        width: 2, // Set border width
                                      ),
                                      borderRadius: BorderRadius.circular(
                                          10), // Add a border radius
                                    ),
                                  )
                                ],
                              );
                            },
                          ),
                          Expanded(child: Container()),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.white,
                              backgroundColor: const Color(
                                  0xFF00A8FF), // Set the text color to white
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    10), // Set the border radius to 10 pixels
                              ),
                            ),
                            onPressed: () {
                              context.goNamed('MedicineStockList');
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.75,
                              height:
                                  51, // Set the width to 80% of the screen width
                              alignment: Alignment.center, // Center the text
                              child: const Text(
                                'Entrar',
                                style: TextStyle(
                                  fontSize:
                                      16, // Set the font size to 16 pixels
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              elevation: 0,
                              side: const BorderSide(
                                color: Color(0xFF00A8FF),
                                width: 1,
                              ),
                              backgroundColor: Colors.white,
                              foregroundColor: const Color(
                                  0xFF00A8FF), // Set the text color to white
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    10), // Set the border radius to 10 pixels
                              ),
                            ),
                            onPressed: () {
                              context.goNamed('MedicineStockList');
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.75,
                              height:
                                  51, // Set the width to 80% of the screen width
                              alignment: Alignment.center, // Center the text
                              child: const Text(
                                'Cadastrar',
                                style: TextStyle(
                                  fontSize:
                                      16, // Set the font size to 16 pixels
                                ),
                              ),
                            ),
                          ),
                          Expanded(child: Container()),
                        ],
                      ),
                    ),
                  ),
                ],
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
