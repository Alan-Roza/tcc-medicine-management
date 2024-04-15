import 'package:flutter/material.dart';
import 'package:tcc_medicine_management/app/modules/unauth/presentation/widgets/geometric_curved_bottom_sheet_widget.dart';
import 'package:tcc_medicine_management/app/modules/unauth/presentation/widgets/geometric_one_widget.dart';
import 'package:tcc_medicine_management/app/modules/unauth/presentation/widgets/geometric_three_widget.dart';
import 'package:tcc_medicine_management/app/modules/unauth/presentation/widgets/geometric_two_widget.dart';

class UnauthLayoutWidget extends StatelessWidget {
  final Widget child;
  final Widget logo;

  const UnauthLayoutWidget(
      {super.key, required this.child, required this.logo});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Column(
      children: [
        Expanded(
          flex: 3,
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
                        child: logo,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        child,
      ],
    );
  }
}
