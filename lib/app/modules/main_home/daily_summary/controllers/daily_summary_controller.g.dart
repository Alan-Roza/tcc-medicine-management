// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'daily_summary_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$DailySummaryController on _DailySummaryController, Store {
  late final _$totalToConsumeAtom =
      Atom(name: '_DailySummaryController.totalToConsume', context: context);

  @override
  int get totalToConsume {
    _$totalToConsumeAtom.reportRead();
    return super.totalToConsume;
  }

  @override
  set totalToConsume(int value) {
    _$totalToConsumeAtom.reportWrite(value, super.totalToConsume, () {
      super.totalToConsume = value;
    });
  }

  late final _$consumedAtom =
      Atom(name: '_DailySummaryController.consumed', context: context);

  @override
  int get consumed {
    _$consumedAtom.reportRead();
    return super.consumed;
  }

  @override
  set consumed(int value) {
    _$consumedAtom.reportWrite(value, super.consumed, () {
      super.consumed = value;
    });
  }

  late final _$notConsumedAtom =
      Atom(name: '_DailySummaryController.notConsumed', context: context);

  @override
  int get notConsumed {
    _$notConsumedAtom.reportRead();
    return super.notConsumed;
  }

  @override
  set notConsumed(int value) {
    _$notConsumedAtom.reportWrite(value, super.notConsumed, () {
      super.notConsumed = value;
    });
  }

  late final _$inProgressAtom =
      Atom(name: '_DailySummaryController.inProgress', context: context);

  @override
  int get inProgress {
    _$inProgressAtom.reportRead();
    return super.inProgress;
  }

  @override
  set inProgress(int value) {
    _$inProgressAtom.reportWrite(value, super.inProgress, () {
      super.inProgress = value;
    });
  }

  late final _$_DailySummaryControllerActionController =
      ActionController(name: '_DailySummaryController', context: context);

  @override
  void updateCounts(
      {required int total,
      required int consumed,
      required int notConsumed,
      required int inProgress}) {
    final _$actionInfo = _$_DailySummaryControllerActionController.startAction(
        name: '_DailySummaryController.updateCounts');
    try {
      return super.updateCounts(
          total: total,
          consumed: consumed,
          notConsumed: notConsumed,
          inProgress: inProgress);
    } finally {
      _$_DailySummaryControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
totalToConsume: ${totalToConsume},
consumed: ${consumed},
notConsumed: ${notConsumed},
inProgress: ${inProgress}
    ''';
  }
}
