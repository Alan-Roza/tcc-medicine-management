import 'package:mobx/mobx.dart';

part 'daily_summary_controller.g.dart';

class DailySummaryController = _DailySummaryController with _$DailySummaryController;

abstract class _DailySummaryController with Store {
   @observable
  int totalToConsume = 3;

  @observable
  int consumed = 1;

  @observable
  int notConsumed = 1;

  @observable
  int inProgress = 1;

  @action
  void updateCounts({required int total, required int consumed, required int notConsumed, required int inProgress}) {
    totalToConsume = total;
    this.consumed = consumed;
    this.notConsumed = notConsumed;
    this.inProgress = inProgress;
  }
}
