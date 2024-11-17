import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tcc_medicine_management/app/modules/main_home/profile/shared/patient_card_widget/model/patient_card_model.dart';

part 'patient_card_controller.g.dart';

class PatientCardController = PatientCardControllerBase with _$PatientCardController;

abstract class PatientCardControllerBase with Store {
  @observable
  bool isSelected = false;

  @observable
  int id = 0;

  @observable
  String name = '';

  @observable
  int age = 0;

  @observable
  String cellphone = '';

  @observable
  String gender = '';

  @observable
  DateTime? lastAccess;

  @observable
  String imageUrl = '';

  PatientCardControllerBase({
    this.id = 0,
    this.name = '',
    this.age = 0,
    this.cellphone = '',
    this.gender = '',
    this.lastAccess,
    this.imageUrl = '',
  });

  @action
  void updatePatient(PatientCard patient) {
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
