import 'dart:io';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mobx/mobx.dart';
import 'package:tcc_medicine_management/app/modules/main_home/profile/connection/list/model/dto/connection_list_response_dto.dart';
import 'package:tcc_medicine_management/app/modules/main_home/profile/connection/list/repository/connection_list_repository.dart';
import 'package:tcc_medicine_management/app/modules/medicine/form/model/medicine_dto.dart';
import 'package:tcc_medicine_management/app/modules/medicine/form/repository/medicine_repository.dart';
import 'package:tcc_medicine_management/main.dart';

part 'medicine_form_controller.g.dart';

class MedicineFormController = MedicineFormControllerBase with _$MedicineFormController;

enum MedicineType {
  comprimido,
  capsula,
  liquido,
}

enum ImportanceLevel {
  nenhuma,
  baixa,
  media,
  alta,
  critica,
}

extension MedicineTypeExtension on MedicineType {
  String get displayName {
    switch (this) {
      case MedicineType.comprimido:
        return 'Comprimido';
      case MedicineType.capsula:
        return 'Cápsula';
      case MedicineType.liquido:
        return 'Líquido';
      default:
        return '';
    }
  }
}
extension StringToMedicineTypeExtension on String {
  MedicineType get medicineType {
    switch (this) {
      case 'Comprimido':
        return MedicineType.comprimido;
      case 'Cápsula':
        return MedicineType.capsula;
      case 'Líquido':
        return MedicineType.liquido;
      default:
        throw Exception('Invalid Medicine Type');
    }
  }
}

extension ImportanceLevelExtension on ImportanceLevel {
  String get displayName {
    switch (this) {
      case ImportanceLevel.nenhuma:
        return 'Nenhuma';
      case ImportanceLevel.baixa:
        return 'Baixa';
      case ImportanceLevel.media:
        return 'Média';
      case ImportanceLevel.alta:
        return 'Alta';
      case ImportanceLevel.critica:
        return 'Crítica';
      default:
        return '';
    }
  }
}

extension StringToImportanceLevelExtension on String {
  ImportanceLevel get importanceLevel {
    switch (this) {
      case 'Nenhuma':
        return ImportanceLevel.nenhuma;
      case 'Baixa':
        return ImportanceLevel.baixa;
      case 'Média':
        return ImportanceLevel.media;
      case 'Alta':
        return ImportanceLevel.alta;
      case 'Crítica':
        return ImportanceLevel.critica;
      default:
        throw Exception('Invalid Importance Level');
    }
  }
}

abstract class MedicineFormControllerBase with Store {
  final MedicineRepository _medicineRepository = getIt<MedicineRepository>();
  final ConnectionListRepository _drawerRepository = getIt<ConnectionListRepository>();

  @observable
  String? medicineImageUrl;

  TextEditingController nameController = TextEditingController();
  TextEditingController quantityController = TextEditingController();
  TextEditingController unityController = TextEditingController();
  TextEditingController qtyByPackageController = TextEditingController();
  @observable
  MedicineType medicineType = MedicineType.comprimido;

  @observable
  ImportanceLevel importanceLevel = ImportanceLevel.media;
  TextEditingController valuePaidController = TextEditingController();
  TextEditingController expirationDateController = TextEditingController();
  TextEditingController drawerNumberController = TextEditingController();
  TextEditingController hardwareIdController = TextEditingController();

  @observable
  List<Map<String, String>> drawers = [];

  @observable
  int drawerNumber = 0;

  @action
  Future<List<Map<String, String>>> getDrawersResource() async {
    try {
      final List<ConnectionListResponseDto> dataResponse = await _drawerRepository.exec();

      drawers.clear();

      for (var drawer in dataResponse) {
        drawers.add({
          'name': drawer.name ?? '',
          'id': drawer.hardwareId ?? '',
          'drawerNumber': (drawer.drawerNumber ?? 0).toString(),
        });
      }

      return drawers;
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  // @computed
  // bool get isFormValid =>
  //   name.isNotEmpty &&
  //   type.isNotEmpty &&
  //   quantity.isNotEmpty &&
  //   unity.isNotEmpty &&
  //   qtyByPackage.isNotEmpty &&
  //   expirationDate.isNotEmpty &&
  //   number.isNotEmpty &&
  //   totalPaid.isNotEmpty;

  // @action
  // Future<bool> submitForm() async {
  //   if (isFormValid) {
  //   // Se o formulário for válido, processe os dados aqui...
  //   print('Formulário enviado com sucesso!');
  //   print('Nome: $name');
  //   print('Tipo: $type');
  //   print('Quantidade: $quantity');
  //   print('Unidade: $unity');
  //   print('Quantidade por pacote: $qtyByPackage');
  //   print('Data de validade: $expirationDate');
  //   print('Número: $number');
  //   print('Total pago: $totalPaid');

  //   return true;
  // } else {
  //   // Se o formulário não for válido, você pode lançar uma exceção ou lidar com o erro de alguma outra maneira...
  //   return false;
  // }
  // }

  // @action
  // Future<bool> saveMedicine() async {
  //   final medicine = Medicine(
  //     name: nameController.text,
  //     type: typeController.text,
  //     quantity: int.parse(quantityController.text),
  //     unity: int.parse(unityController.text),
  //     qtyByPackage: int.parse(qtyByPackageController.text),
  //     valuePaid: double.parse(valuePaidController.text),
  //     expirationDate: expirationDateController.text,
  //     drawerNumber: int.parse(drawerNumberController.text),
  //     importanceLevel: importanceLevel,
  //   );

  //   print(medicine);
  //   return true;
  // }

  @action
  void setExpirationDate(DateTime value) {
    expirationDateController.text = DateFormat('dd/MM/yyyy').format(value);
  }

  @action
  Future<MedicineDto> saveMedicine(GlobalKey<FormState>? formKey) async {
    try {
      // TODO: will be implemented at future
      // if (!formKey.currentState!.validate()) {
      //   return Future.error('Preencha os campos corretamente!');
      // }

      final MedicineDto medicine = MedicineDto(
        name: nameController.text,
        type: medicineType.displayName,
        importance: importanceLevel.displayName,
        storageQuantity: int.parse(quantityController.text),
        // unitType: unityController.text,
        price: valuePaidController.text.isNotEmpty ? double.parse(valuePaidController.text.replaceAll(',', '.')) : null,
        expirationDate: expirationDateController.text.isNotEmpty
          ? DateFormat('yyyy-MM-ddTHH:mm:ss.SSSZ').format(DateFormat('dd/MM/yyyy').parse(expirationDateController.text))
          : null,
        drawerNumber: drawerNumberController.text.isEmpty ? 0 : int.parse(drawerNumberController.text),
        // hardwareId: hardwareIdController.text,
        hardwareId: drawers.firstWhere((drawer) => drawer['name'] == hardwareIdController.text)['id'],
      );

      final MedicineDto dataResponse = await _medicineRepository.exec(medicine);
      return dataResponse;
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  @action
  Future<String> uploadMedicineImage(File medicineImage, int medicineId) async {
    try {
      final String dataResponse = await _medicineRepository.uploadMedicineImage(medicineImage, medicineId);
      return dataResponse;
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  @action
  Future<String> getMedicineImage(int medicineId) async {
    try {
      final String dataResponse = await _medicineRepository.getMedicineImage(medicineId);
      return dataResponse;
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  void dispose() {
    nameController.dispose();
    medicineType = MedicineType.comprimido;
    quantityController.dispose();
    unityController.dispose();
    qtyByPackageController.dispose();
    valuePaidController.dispose();
    expirationDateController.dispose();
    importanceLevel = ImportanceLevel.media;
    drawerNumberController.dispose();
    hardwareIdController.dispose();
    medicineImageUrl = null;
  }

  @action
  void resetForm() {
    nameController.clear();
    medicineType = MedicineType.comprimido;
    quantityController.clear();
    unityController.clear();
    qtyByPackageController.clear();
    valuePaidController.clear();
    expirationDateController.clear();
    importanceLevel = ImportanceLevel.media;
    drawerNumberController.clear();
    hardwareIdController.clear();
    medicineImageUrl = null;
  }
}
