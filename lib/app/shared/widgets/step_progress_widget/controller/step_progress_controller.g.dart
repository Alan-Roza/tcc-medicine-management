// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'step_progress_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$StepProgressController on _StepProgressController, Store {
  late final _$currentStepAtom =
      Atom(name: '_StepProgressController.currentStep', context: context);

  @override
  int get currentStep {
    _$currentStepAtom.reportRead();
    return super.currentStep;
  }

  @override
  set currentStep(int value) {
    _$currentStepAtom.reportWrite(value, super.currentStep, () {
      super.currentStep = value;
    });
  }

  late final _$_StepProgressControllerActionController =
      ActionController(name: '_StepProgressController', context: context);

  @override
  void setCurrentStep(int newStep) {
    final _$actionInfo = _$_StepProgressControllerActionController.startAction(
        name: '_StepProgressController.setCurrentStep');
    try {
      return super.setCurrentStep(newStep);
    } finally {
      _$_StepProgressControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void increaseCurrentStep() {
    final _$actionInfo = _$_StepProgressControllerActionController.startAction(
        name: '_StepProgressController.increaseCurrentStep');
    try {
      return super.increaseCurrentStep();
    } finally {
      _$_StepProgressControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void decreaseCurrentStep() {
    final _$actionInfo = _$_StepProgressControllerActionController.startAction(
        name: '_StepProgressController.decreaseCurrentStep');
    try {
      return super.decreaseCurrentStep();
    } finally {
      _$_StepProgressControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
currentStep: ${currentStep}
    ''';
  }
}
