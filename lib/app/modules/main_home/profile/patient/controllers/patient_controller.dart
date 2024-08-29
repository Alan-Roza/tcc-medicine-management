import 'package:mobx/mobx.dart';
import 'package:tcc_medicine_management/app/modules/main_home/profile/shared/patient_card_widget/controllers/patient_card_controller.dart';
import 'package:tcc_medicine_management/app/modules/main_home/profile/shared/patient_card_widget/model/patient_card_model.dart';

part 'patient_controller.g.dart';

class PatientController = _PatientController with _$PatientController;

abstract class _PatientController with Store {
  @observable
  ObservableList<PatientCardController> patientCards = ObservableList<PatientCardController>();

  @action
  void createPatientCardList() {
    for (int i = 0; i <= 20; i++) {
      patientCards.add(
        PatientCardController(
          PatientCard(
            name: 'Medicine $i',
            age: i,
            cellphone: '(15) 98812-3456',
            gender: 'Luna Roza',
            lastAccess: DateTime.now(),
            imageUrl: 'https://picsum.photos/200/300',
          ),
        ),
      );
    }
  }
}
