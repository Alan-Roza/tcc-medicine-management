import 'package:mobx/mobx.dart';

part 'main_home_controller.g.dart';

class MainHomeController = _MainHomeController with _$MainHomeController;

abstract class _MainHomeController with Store {
  @observable
  int currentPage = 0;

  @observable
  int selectedIndex = 0;

  @action
  void setPage(int page) {
    currentPage = page;
  }

  @action
  void setSelectedIndex(int index) {
    selectedIndex = index;
  }
}
