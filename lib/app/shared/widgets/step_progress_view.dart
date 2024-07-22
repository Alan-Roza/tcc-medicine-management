import 'package:flutter/material.dart';
import 'package:easy_stepper/easy_stepper.dart';

class StepProgressView extends StatefulWidget {
  final double _width;

  final List<String> _titles;
  final int _currrentStep;
  final Color _activeColor;

  const StepProgressView(
      {required Key key,
      required int curStep,
      required List<String> titles,
      required double width,
      required Color color})
      : _titles = titles,
        _currrentStep = curStep,
        _width = width,
        _activeColor = color,
        assert(width > 0),
        super(key: key);

  @override
  State<StepProgressView> createState() => _StepProgressViewState();
}

class _StepProgressViewState extends State<StepProgressView> {
  int activeStep = 1;
  double progress = 0.2;

  final Color _inactiveColor = const Color(0xFFE6EEF3);
  final double lineWidth = 3.0;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width / 3;

    return Column(
      children: <Widget>[
        EasyStepper(
          activeStep: activeStep,
          lineStyle: LineStyle(
            lineLength: width,
            lineType: LineType.normal,
            finishedLineColor: Colors.blue,
            unreachedLineType: LineType.normal,
            unreachedLineColor: Colors.grey.shade400,
            lineThickness: 2,
            lineSpace: 1,
            lineWidth: 10,
          ),
          finishedStepBorderColor: Colors.blue,
          finishedStepTextColor: Colors.black54,
          finishedStepBackgroundColor: Colors.blue,

          unreachedStepBorderColor: Colors.black26,
          unreachedStepTextColor: Colors.black26,
          unreachedStepBackgroundColor: Colors.black26,

          activeStepBorderColor: Colors.blue,
          activeStepTextColor: Colors.black87,
          activeStepBackgroundColor: Colors.white,
          activeStepIconColor: Colors.black87,
          
          showLoadingAnimation: false,
          showStepBorder: true,
          stepRadius: 8,
            steps: widget._titles.map((title) {
              int index = widget._titles.indexOf(title);
              return EasyStep(
                customStep: CircleAvatar(
                  radius: 8,
                  backgroundColor: activeStep >= index ? Colors.blue : Colors.black26,
                  child: CircleAvatar(
                    radius: 7,
                    backgroundColor: activeStep >= index ? Colors.blue : Colors.black26,
                  ),
                ),
                title: title,
              );
            }).toList(),
            // EasyStep(
            //   topTitle: false,
            //   customStep: CircleAvatar(
            //     radius: 8,
            //     backgroundColor: activeStep >= 1 ? Colors.blue : Colors.grey.shade600,
            //     child: CircleAvatar(
            //       radius: 7,
            //       backgroundColor: activeStep >= 1 ? Colors.white : Colors.grey.shade500,
            //     ),
            //   ),
            //   title: 'Order Received',
            // ),
            // EasyStep(
            //   customStep: CircleAvatar(
            //     radius: 8,
            //     backgroundColor: Colors.white,
            //     child: CircleAvatar(
            //       radius: 7,
            //       backgroundColor:
            //           activeStep >= 2 ? Colors.orange : const Color.fromARGB(255, 168, 0, 0),
            //     ),
            //   ),
            //   title: 'Preparing',
            // ),
          onStepReached: (index) => setState(() => activeStep = index),
        ),
      ],
    );
  }
}
