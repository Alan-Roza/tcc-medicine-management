import 'package:mobx/mobx.dart';

part 'medicine_form_controller.g.dart';

class MedicineFormController = MedicineFormControllerBase with _$MedicineFormController;

abstract class MedicineFormControllerBase with Store {
  @observable
  String name = '';

  @observable
  String type = '';

  @observable
  String quantity = '';

  @observable
  String unity = '';

  @observable
  String qtyByPackage = '';

  @observable
  String expirationDate = '';

  @observable
  String number = '';

  @observable
  String totalPaid = '';

  @computed
  bool get isFormValid => 
    name.isNotEmpty && 
    type.isNotEmpty && 
    quantity.isNotEmpty && 
    unity.isNotEmpty && 
    qtyByPackage.isNotEmpty && 
    expirationDate.isNotEmpty && 
    number.isNotEmpty && 
    totalPaid.isNotEmpty;

  @action
  Future<bool> submitForm() async {
    if (isFormValid) {
    // Se o formulário for válido, processe os dados aqui...
    print('Formulário enviado com sucesso!');
    print('Nome: $name');
    print('Tipo: $type');
    print('Quantidade: $quantity');
    print('Unidade: $unity');
    print('Quantidade por pacote: $qtyByPackage');
    print('Data de validade: $expirationDate');
    print('Número: $number');
    print('Total pago: $totalPaid');

    return true;
  } else {
    // Se o formulário não for válido, você pode lançar uma exceção ou lidar com o erro de alguma outra maneira...
    return false;
  }
  }

  @action
  void setName(String value) => name = value;

  @action
  void setType(String value) => type = value;

  @action
  void setQuantity(String value) => quantity = value;

  @action
  void setUnity(String value) => unity = value;

  @action
  void setQtyByPackage(String value) => qtyByPackage = value;

  @action
  void setExpirationDate(String value) => expirationDate = value;

  @action
  void setNumber(String value) => number = value;

  @action
  void setTotalPaid(String value) => totalPaid = value;
}