import 'package:mobx/mobx.dart';
import 'package:tcc_medicine_management/app/modules/main_home/profile/connection/list/model/dto/connection_list_response_dto.dart';
import 'package:tcc_medicine_management/app/modules/main_home/profile/connection/list/repository/connection_list_repository.dart';
import 'package:tcc_medicine_management/main.dart';

part 'connection_controller.g.dart';

class ConnectionController = _ConnectionController with _$ConnectionController;

abstract class _ConnectionController with Store {
  final ConnectionListRepository _connectionListRepository = getIt<ConnectionListRepository>();

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

  @action
  Future<void> getListConnections() async {
    try {
      final List<ConnectionListResponseDto> dataResponse = await _connectionListRepository.exec();

      drawerItems.clear();
      for (var connection in dataResponse) {
        drawerItems.add(connection.name!);
      }
    } catch (e) {
      return Future.error(e.toString());
    }
  }
}
