import 'package:mobx/mobx.dart';

part 'user_level_assistance_controller.g.dart';

class UserLevelAssistanceController = _UserLevelAssistanceController with _$UserLevelAssistanceController;

abstract class _UserLevelAssistanceController with Store {
  @observable
  int currentPage = 0;

  @action
  void setPage(int page) {
    currentPage = page;
  }

  @observable
  bool assistanceRequired = false;

  @action
  void toggleAssistance() {
    assistanceRequired = !assistanceRequired;
  }
}
