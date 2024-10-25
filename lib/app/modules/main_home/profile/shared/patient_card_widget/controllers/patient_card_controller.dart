import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tcc_medicine_management/app/modules/main_home/profile/shared/patient_card_widget/model/patient_card_model.dart';

part 'patient_card_controller.g.dart';

class PatientCardController = PatientCardControllerBase with _$PatientCardController;

abstract class PatientCardControllerBase with Store {
  @observable
  late bool isSelected;

  @observable
  late int id;

  @observable
  late String name;

  @observable
  late int age;

  @observable
  late String cellphone;

  @observable
  late String gender;

  @observable
  late DateTime? lastAccess;

  @observable
  late String imageUrl;

  PatientCardControllerBase(PatientCard? patient) {
    if (patient == null) return;

    id = patient.id;
    name = patient.name;
    age = patient.age;
    cellphone = patient.cellphone;
    gender = patient.gender;
    lastAccess = patient.lastAccess;
    imageUrl = patient.imageUrl;
  }

  @action
  Future<void> accessPatient(int id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('patientId', id.toString());
  }

  @action
  void toggleSelection() => isSelected = !isSelected;

  @action
  void removeSelection() => isSelected = false;

  @action
  void addSelection() => isSelected = true;
}
