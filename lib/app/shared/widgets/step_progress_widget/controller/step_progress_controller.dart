import 'package:mobx/mobx.dart';

part 'step_progress_controller.g.dart';

class StepProgressController = _StepProgressController with _$StepProgressController;

abstract class _StepProgressController with Store {
  @observable
  int currentStep = 0;

  @action
  void setCurrentStep(int newStep) {
    currentStep = newStep;
  }

  @action
  void increaseCurrentStep() {
    currentStep++;
  }

  @action
  void decreaseCurrentStep() {
    currentStep--;
  }
}