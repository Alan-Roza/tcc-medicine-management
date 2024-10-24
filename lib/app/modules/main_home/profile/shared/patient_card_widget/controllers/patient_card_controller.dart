import 'package:mobx/mobx.dart';
import 'package:tcc_medicine_management/app/modules/main_home/profile/shared/patient_card_widget/model/patient_card_model.dart';

part 'patient_card_controller.g.dart';

class PatientCardController = PatientCardControllerBase with _$PatientCardController;

abstract class PatientCardControllerBase with Store {
  @observable
  late bool isSelected;
  late String login;
  late String name;
  late int age;
  late String cellphone;
  late String gender;
  late DateTime? lastAccess;
  late String imageUrl;

  PatientCardControllerBase(PatientCard? patient) {
    if (patient == null) return;

    login = patient.login;
    name = patient.name;
    age = patient.age;
    cellphone = patient.cellphone;
    gender = patient.gender;
    lastAccess = patient.lastAccess;
    imageUrl = patient.imageUrl;
  }

  @action
  void toggleSelection() => isSelected = !isSelected;

  @action
  void removeSelection() => isSelected = false;

  @action
  void addSelection() => isSelected = true;
}
