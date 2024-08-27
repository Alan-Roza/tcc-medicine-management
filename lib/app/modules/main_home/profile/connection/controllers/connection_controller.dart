import 'package:mobx/mobx.dart';

part 'connection_controller.g.dart';

class ConnectionController = _ConnectionController with _$ConnectionController;

abstract class _ConnectionController with Store {
 @observable
  ObservableList<String> drawerItems = ObservableList<String>();

  @action
  void addItem(List<String> connections) {
    drawerItems.addAll(connections);
  }

  @action
  void removeItem(String item) {
    drawerItems.remove(item);
  }
}
