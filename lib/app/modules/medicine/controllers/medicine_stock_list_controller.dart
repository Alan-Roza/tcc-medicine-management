import 'package:mobx/mobx.dart';

part 'medicine_stock_list_controller.g.dart';

class MedicineStockListController = _MedicineStockListController with _$MedicineStockListController;

abstract class _MedicineStockListController with Store {
   @observable
  ObservableList<CardItem> cardItems = ObservableList<CardItem>();

  @action
  void addCard(CardItem item) {
    cardItems.add(item);
  }
}

class CardItem {
  String name;
  String type;
  int quantity;
  String expirationDate;
  double price;
  String priority;

  CardItem({
    required this.name,
    required this.type,
    required this.quantity,
    required this.expirationDate,
    required this.price,
    required this.priority,
  });
}