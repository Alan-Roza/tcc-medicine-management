import 'package:flutter/material.dart';
import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:tcc_medicine_management/app/shared/widgets/step_progress_widget/controller/step_progress_controller.dart';

class StepProgressWidget extends StatefulWidget {
  final List<String> _titles;
  final int currentStep;

  const StepProgressWidget({
    super.key,
    required List<String> titles,
    required this.currentStep,
  }) : _titles = titles;

  @override
  StepProgressWidgetState createState() => StepProgressWidgetState();
}

class StepProgressWidgetState extends State<StepProgressWidget> {
  final StepProgressController stepProgressController = StepProgressController();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width / widget._titles.length;

    return Observer(
      builder: (_) => EasyStepper(
        activeStep: stepProgressController.currentStep,
        lineStyle: LineStyle(
          lineLength: width,
          lineType: LineType.normal,
          finishedLineColor: Colors.blue,
          activeLineColor: Colors.black26,
          unreachedLineType: LineType.normal,
          unreachedLineColor: Colors.black26,
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
        activeStepBorderType: BorderType.normal,
        activeStepTextColor: Colors.black87,
        activeStepBackgroundColor: Colors.white,
        activeStepIconColor: Colors.black87,
        showLoadingAnimation: false,
        showStepBorder: true,
        stepRadius: 8,
        steps: widget._titles.map((title) {
          int index = widget._titles.indexOf(title);
          return EasyStep(
            title: title,
            customStep: CircleAvatar(
              radius: 8,
              backgroundColor: stepProgressController.currentStep == index
                  ? Colors.white
                  : stepProgressController.currentStep >= index
                      ? Colors.blue
                      : Colors.grey.shade400,
              // child: CircleAvatar(
              //   radius: 7,
              //   backgroundColor: stepProgressController.currentStep >= index ? Colors.blue : Colors.black26,
              // ),
            ),
          );
        }).toList(),
        onStepReached: (index) => stepProgressController.setCurrentStep(index), // TODO - verify if is necessary
      ),
    );
  }
}
