import 'package:mobx/mobx.dart';

part 'screen_assistance_controller.g.dart';

class ScreenAssistanceController = _ScreenAssistanceController with _$ScreenAssistanceController;

abstract class _ScreenAssistanceController with Store { 
  @observable
  int currentPage = 0;

  @action
  void setPage(int page) {
    currentPage = page;
  }

  @action
  void goToNextPage() {
    currentPage++;
  }

  @action
  void goToPreviousPage() {
    currentPage--;
  }
}
