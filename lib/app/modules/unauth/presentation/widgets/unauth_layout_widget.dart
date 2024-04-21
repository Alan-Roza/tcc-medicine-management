import 'package:flutter/material.dart';
import 'package:tcc_medicine_management/app/modules/unauth/presentation/widgets/geometric_curved_bottom_sheet_widget.dart';
import 'package:tcc_medicine_management/app/modules/unauth/presentation/widgets/geometric_one_widget.dart';
import 'package:tcc_medicine_management/app/modules/unauth/presentation/widgets/geometric_three_widget.dart';
import 'package:tcc_medicine_management/app/modules/unauth/presentation/widgets/geometric_two_widget.dart';

class UnauthLayoutWidget extends StatefulWidget {
  final Widget child;
  final Widget logo;
  final double dinamicHeight;

  const UnauthLayoutWidget(
      {super.key,
      required this.child,
      required this.logo,
      required this.dinamicHeight});

  @override
  State<UnauthLayoutWidget> createState() => _UnauthLayoutWidgetState();
}

class _UnauthLayoutWidgetState extends State<UnauthLayoutWidget> with WidgetsBindingObserver {
  double keyboardHeight = 0.0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeMetrics() {
    final value = WidgetsBinding.instance.window.viewInsets.bottom;
    setState(() {
      keyboardHeight = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    // double keyboardHeight = MediaQuery.of(context).viewInsets.bottom;

    return Column(
      children: [
        SizedBox(
          height: widget.dinamicHeight,
          child: Stack(
            children: [
              Align(
                alignment: Alignment.bottomCenter,
                child: SizedBox(
                  height: height / 5.toDouble(), // Set this to a suitable value
                  child: Stack(
                    children: [
                      Positioned(
                        top: -1,
                        bottom: -1,
                        left: 0,
                        right: 0,
                        child: Container(
                          color: const Color(0xFF33ABE9),
                          child: CustomPaint(
                            size: Size(width, height / 5.toDouble()),
                            painter: GeometricCurvedBottomSheetWidget(),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              if (keyboardHeight == 0.0)
                Center(
                  child: Stack(
                    children: [
                      Positioned(
                        top: 0,
                        right: 0,
                        child: CustomPaint(
                          size: Size(width / 1.5, height / 2.5),
                          painter: GeometricThreeWidget(),
                        ),
                      ),
                      Positioned(
                        top: 0,
                        right: 0,
                        child: CustomPaint(
                          size: Size(width / 3.4, height / 3.4),
                          painter: GeometricOneWidget(),
                        ),
                      ),
                      Positioned(
                        top: height / 10,
                        left: 0,
                        child: CustomPaint(
                          size: Size(width / 8, height / 4),
                          painter: GeometricTwoWidget(),
                        ),
                      ),
                      Transform.translate(
                        offset: const Offset(0,
                            -50), // Adjust the second parameter to move the widget up or down
                        child: Center(
                          child: widget.logo,
                        ),
                      )
                    ],
                  ),
                ),
            ],
          ),
        ),
        widget.child,
      ],
    );
  }
}
