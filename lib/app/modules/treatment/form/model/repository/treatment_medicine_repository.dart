import 'package:tcc_medicine_management/app/modules/treatment/form/model/dto/treatment_medicine_dto.dart';

abstract class ITreatmentMedicineRepository {
  Future<TreatmentMedicineDto> exec(TreatmentMedicineDto data);
  Future<List<Map<String, String>>> resource();
}