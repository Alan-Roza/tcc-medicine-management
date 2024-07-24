import 'package:flutter/material.dart';
import 'package:easy_stepper/easy_stepper.dart';
import 'package:tcc_medicine_management/app/shared/widgets/step_progress_widget/controller/step_progress_controller.dart';

class StepProgressWidget extends StatefulWidget {
  final StepProgressController stepProgressController = StepProgressController();

  final List<String> _titles;
  int currentStep;

  // void initState() {
  //   // super.initState();
  //   reaction((_) => currentStep, (int step) {
  //     print('aaaaaa');
  //     stepProgressController.setCurrentStep(step);
  //   });
  // }

  StepProgressWidget({
    super.key,
    required List<String> titles,
    required this.currentStep,
  }) : _titles = titles;

  @override
  StepProgressWidgetState createState() => StepProgressWidgetState();
}

class StepProgressWidgetState extends State<StepProgressWidget> {

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width / widget._titles.length;

    return SingleChildScrollView(
      child: EasyStepper(
        activeStep: widget.currentStep,
        lineStyle: LineStyle(
          lineLength: width,
          lineType: LineType.normal,
          finishedLineColor: Colors.blue,
          activeLineColor: Colors.black26,
          unreachedLineType: LineType.normal,
          unreachedLineColor: Colors.black26,
          // progress: 0.2, // TODO - when have time, implements progress based in form
          lineThickness: 2,
          lineSpace: 10,
          lineWidth: 1,
        ),
        internalPadding: 0,
         borderThickness: 3,
         defaultStepBorderType: BorderType.normal,
         unreachedStepBorderType: BorderType.normal,
        finishedStepBorderColor: Colors.blue,
        finishedStepTextColor: Colors.black54,
        finishedStepBackgroundColor: Colors.blue,
        unreachedStepBorderColor: Colors.black26,
        unreachedStepTextColor: Colors.black26,
        unreachedStepBackgroundColor: Colors.black26,
        activeStepBorderColor: Colors.blue,
        activeStepBorderType: BorderType.normal,
        activeStepTextColor: Colors.black87,
        activeStepBackgroundColor: Colors.white,
        activeStepIconColor: Colors.white,
        showLoadingAnimation: false,
        titlesAreLargerThanSteps: false,
        showStepBorder: true,
        stepRadius: 10,
        steps: widget._titles.map((title) {
          return EasyStep(
            title: title,
            finishIcon: const Icon(Icons.check),
              icon: const Icon(Icons.circle, color: Colors.white),
            // customStep: CircleAvatar(
            //   backgroundColor: widget.currentStep == index
            //       ? Colors.white
            //       : widget.currentStep >= index
            //           ? Colors.blue
            //           : Colors.grey.shade400,
            //   // child: CircleAvatar(
            //   //   radius: 7,
            //   //   backgroundColor: widget.currentStep >= index ? Colors.blue : Colors.black26,
            //   // ),
            // ),
          );
        }).toList(),
        // onStepReached: (index) => widget.setCurrentStep(index), // TODO - verify if is necessary
        onStepReached: (index) => setState(() {
          widget.currentStep = index;
        }),
      ),
    );
  }
}
