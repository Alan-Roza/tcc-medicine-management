import 'dart:io';

import 'package:tcc_medicine_management/app/modules/medicine/form/model/medicine_dto.dart';

abstract class IMedicineRepository {
  Future<MedicineDto> exec(MedicineDto data);
  Future<String> uploadMedicineImage(File imageFile, int medicineId);
  Future<String> getMedicineImage(int medicineId);
}