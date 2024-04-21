import 'package:flutter/material.dart';
import 'package:easy_stepper/easy_stepper.dart';

class StepProgressView extends StatefulWidget {
  final double _width;

  final List<String> _titles;
  final int _curStep;
  final Color _activeColor;

  const StepProgressView(
      {required Key key,
      required int curStep,
      required List<String> titles,
      required double width,
      required Color color})
      : _titles = titles,
        _curStep = curStep,
        _width = width,
        _activeColor = color,
        assert(width > 0),
        super(key: key);

  @override
  State<StepProgressView> createState() => _StepProgressViewState();
}

class _StepProgressViewState extends State<StepProgressView> {
  int activeStep = 0;
  int activeStep2 = 0;
  int reachedStep = 0;
  int upperBound = 5;
  double progress = 0.2;
  Set<int> reachedSteps = <int>{0, 2, 4, 5};
  final dashImages = [
    'assets/1.png',
    'assets/2.png',
    'assets/3.png',
    'assets/4.png',
    'assets/5.png',
  ];

  void increaseProgress() {
    if (progress < 1) {
      setState(() => progress += 0.2);
    } else {
      setState(() => progress = 0);
    }
  }

  final Color _inactiveColor = const Color(0xFFE6EEF3);
  final double lineWidth = 3.0;

  @override
  Widget build(BuildContext context) {
  double width = MediaQuery.of(context).size.width / 3;
    
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            EasyStepper(
              activeStep: activeStep,
              lineStyle: LineStyle(
                lineLength: width,
                lineType: LineType.normal,
                finishedLineColor: Colors.orange,
                lineThickness: 2,
                lineSpace: 1,
                lineWidth: 10,
                unreachedLineType: LineType.normal,
              ),
              finishedStepBorderColor: Colors.deepOrange,
              finishedStepTextColor: Colors.deepOrange,
              finishedStepBackgroundColor: Colors.deepOrange,
              activeStepTextColor: Colors.black87,
              activeStepIconColor: Colors.deepOrange,
              showLoadingAnimation: false,
              showStepBorder: false,
              stepRadius: 8,
              steps: [
                EasyStep(
                  customStep: CircleAvatar(
                    radius: 8,
                    backgroundColor: Color.fromARGB(255, 236, 0, 0),
                    child: CircleAvatar(
                      radius: 7,
                      backgroundColor:
                          activeStep >= 0 ? Colors.orange : Colors.white,
                    ),
                  ),
                  title: 'Waiting',
                ),
                EasyStep(
                  customStep: CircleAvatar(
                    radius: 8,
                    backgroundColor: Colors.white,
                    child: CircleAvatar(
                      radius: 7,
                      backgroundColor:
                          activeStep >= 1 ? Colors.orange : const Color.fromARGB(255, 209, 78, 78),
                    ),
                  ),
                  title: 'Order Received',
                  topTitle: true,
                ),
                EasyStep(
                  customStep: CircleAvatar(
                    radius: 8,
                    backgroundColor: Colors.white,
                    child: CircleAvatar(
                      radius: 7,
                      backgroundColor:
                          activeStep >= 2 ? Colors.orange : const Color.fromARGB(255, 168, 0, 0),
                    ),
                  ),
                  title: 'Preparing',
                ),
              ],
              onStepReached: (index) => setState(() => activeStep = index),
            ),
          ],
        ),
      ),
    );
  }
}
