import 'package:mobx/mobx.dart';
import 'package:tcc_medicine_management/app/modules/main_home/profile/patient/model/dto/patient_list_response_dto.dart';
import 'package:tcc_medicine_management/app/modules/main_home/profile/patient/repository/patient_repository.dart';
import 'package:tcc_medicine_management/app/modules/main_home/profile/shared/patient_card_widget/controllers/patient_card_controller.dart';
import 'package:tcc_medicine_management/app/modules/main_home/profile/shared/patient_card_widget/model/patient_card_model.dart';
import 'package:tcc_medicine_management/main.dart';

part 'patient_controller.g.dart';

class PatientController = _PatientController with _$PatientController;

abstract class _PatientController with Store {
  final PatientRepository _patientRepository = getIt<PatientRepository>();

  @observable
  ObservableList<PatientCardController> patientCards = ObservableList<PatientCardController>();

  @observable
  String code = '';

  @action
  Future<PatientListResponseDto> getPatientList() async {
    try {
      final PatientListResponseDto dataResponse = await _patientRepository.getPatientList();

      dataResponse.patients?.forEach((patient) {
        patientCards.add(
          PatientCardController(
            PatientCard(
              login: "Paciente", //TODO: Remove this after fix
              name: patient.name!,
              age: DateTime.now().difference(DateTime.parse(patient.birthdate!)).inDays ~/ 365,
              cellphone: patient.telephone!,
              gender: patient.gender!,
              lastAccess: patient.lastAccess,
              imageUrl: '',
              // imageUrl: Constants.baseUrl + patient.profilePicture ?? '', // TODO: add when server implements
            ),
          ),
        );
      });

      return dataResponse;
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  @action
  Future<String> generateCode() async {
    try {
      final String codeResponse = await _patientRepository.generateCode();

      code = codeResponse;

      return codeResponse;
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  @action
  void clearPatientCards() {
    patientCards.clear();
  }
}
