import 'package:mobx/mobx.dart';

part 'medicine_stock_list_controller.g.dart';

class MedicineStockListController = _MedicineStockListController with _$MedicineStockListController;

abstract class _MedicineStockListController with Store {
  @observable
  ObservableList<Medicamento> medicamentos = ObservableList<Medicamento>();

  @action
  void adicionarMedicamento(Medicamento medicamento) {
    medicamentos.add(medicamento);
  }

  @action
  void removerMedicamento(Medicamento medicamento) {
    medicamentos.remove(medicamento);
  }
}

class Medicamento {
  String tipo;
  String nome;
  int quantidade;
  DateTime vencimento;
  double preco;
  bool importante;

  Medicamento({
    required this.tipo,
    required this.nome,
    required this.quantidade,
    required this.vencimento,
    required this.preco,
    required this.importante,
  });
}