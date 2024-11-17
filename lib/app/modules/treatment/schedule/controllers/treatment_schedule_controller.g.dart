// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'treatment_schedule_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TreatmentScheduleController on _TreatmentScheduleController, Store {
  late final _$selectedDateAtom =
      Atom(name: '_TreatmentScheduleController.selectedDate', context: context);

  @override
  DateTime get selectedDate {
    _$selectedDateAtom.reportRead();
    return super.selectedDate;
  }

  @override
  set selectedDate(DateTime value) {
    _$selectedDateAtom.reportWrite(value, super.selectedDate, () {
      super.selectedDate = value;
    });
  }

  late final _$eventsAtom =
      Atom(name: '_TreatmentScheduleController.events', context: context);

  @override
  ObservableList<Map<String, dynamic>> get events {
    _$eventsAtom.reportRead();
    return super.events;
  }

  @override
  set events(ObservableList<Map<String, dynamic>> value) {
    _$eventsAtom.reportWrite(value, super.events, () {
      super.events = value;
    });
  }

  late final _$getMedicineTreatmentByDayAsyncAction = AsyncAction(
      '_TreatmentScheduleController.getMedicineTreatmentByDay',
      context: context);

  @override
  Future<void> getMedicineTreatmentByDay(DateTime date) {
    return _$getMedicineTreatmentByDayAsyncAction
        .run(() => super.getMedicineTreatmentByDay(date));
  }

  late final _$_TreatmentScheduleControllerActionController =
      ActionController(name: '_TreatmentScheduleController', context: context);

  @override
  void selectDate(DateTime date) {
    final _$actionInfo = _$_TreatmentScheduleControllerActionController
        .startAction(name: '_TreatmentScheduleController.selectDate');
    try {
      return super.selectDate(date);
    } finally {
      _$_TreatmentScheduleControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
selectedDate: ${selectedDate},
events: ${events}
    ''';
  }
}
