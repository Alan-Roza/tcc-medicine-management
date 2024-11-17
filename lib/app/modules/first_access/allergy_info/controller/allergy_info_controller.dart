import 'package:mobx/mobx.dart';
import 'package:tcc_medicine_management/app/modules/first_access/allergy_info/model/dto/allergy_info_dto.dart';
import 'package:tcc_medicine_management/app/modules/first_access/allergy_info/repository/allergy_info_repository.dart';
import 'package:tcc_medicine_management/main.dart';

part 'allergy_info_controller.g.dart';

class AllergyInfoController = _AllergyInfoController with _$AllergyInfoController;

abstract class _AllergyInfoController with Store {
  final AllergyInfoRepository _allergyInfoRepository = getIt<AllergyInfoRepository>();

  @observable
  ObservableList<String> medicines = ObservableList<String>();

  @action
  void addMedicine(String medicine) {
    final newMedicines = medicine.split(',').map((e) => e.trim()).where((e) => e.isNotEmpty).toList();
    medicines.addAll(newMedicines);
  }

  @action
  void removeMedicine(String medicine) {
    medicines.remove(medicine);
  }

  @action
  void setAllergies(List<AllergyInfoDto> allergies) {
    medicines.clear();
    for (var allergy in allergies) {
      medicines.add(allergy.allergy!);
    }
  }

  @action
  Future<List<AllergyInfoDto>> onSubmit() async {
    try {
      // TODO: will be implemented at future
      // if (!formKey.currentState!.validate()) {
      //   return Future.error('Preencha os campos corretamente!');
      // }

      if (medicines.isEmpty) {
        return Future.error('Adicione ao menos um medicamento!');
      }

      final uniqueMedicines = medicines.toSet().toList();
      if (uniqueMedicines.length != medicines.length) {
        return Future.error('Não pode haver medicamentos repetidos!');
      }

      final List<AllergyInfoDto> allergyInfo = medicines.map((medicine) => AllergyInfoDto(allergy: medicine)).toList();

      final List<AllergyInfoDto> dataResponse = await _allergyInfoRepository.exec(allergyInfo);

      return dataResponse;
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  @action
  Future<List<AllergyInfoDto>> getAllergies() async {
    try {
      final List<AllergyInfoDto> dataResponse = await _allergyInfoRepository.getAllergies();

      return dataResponse;
    } catch (e) {
      return Future.error(e.toString());
    }
  }
}
