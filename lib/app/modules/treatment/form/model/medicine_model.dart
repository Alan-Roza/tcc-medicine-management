import 'package:tcc_medicine_management/app/modules/treatment/form/model/treatment_medicine_model.dart';

class Treatment {
  final String name;
  final String importanceLevel;
  final List<TreatmentMedicine> medicines;

  Treatment({
    required this.name,
    required this.importanceLevel,
    required this.medicines,
  });
}
