import 'package:mobx/mobx.dart';
import 'package:tcc_medicine_management/app/modules/first_access/configurations/model/dto/configurations_info_dto.dart';
import 'package:tcc_medicine_management/app/modules/first_access/configurations/repository/configurations_info_repository.dart';
import 'package:tcc_medicine_management/main.dart';

part 'configurations_controller.g.dart';

class ConfigurationsController = _ConfigurationsController with _$ConfigurationsController;

abstract class _ConfigurationsController with Store {
  final ConfigurationsInfoRepository _configurationsInfoRepository = getIt<ConfigurationsInfoRepository>();

  @observable
  bool allowDataStorage = false;

  @observable
  bool notifyWhatsapp = false;

  @observable
  bool notifyEmail = false;

  @observable
  bool notifyPopup = false;

  @observable
  String fontSize = 'normal';

  @action
  void toggleDataStorage() {
    allowDataStorage = !allowDataStorage;
  }

  void setNotifyWhatsapp(bool value) {
    notifyWhatsapp = value;
  }

  void setNotifyEmail(bool value) {
    notifyEmail = value;
  }

  void setNotifyPopup(bool value) {
    notifyPopup = value;
  }

  void setFontSize(String value) {
    fontSize = value;
  }

  @action
  Future<ConfigurationsInfoDto> onSubmit() async {
    try {
      // TODO: will be implemented at future
      // if (!formKey.currentState!.validate()) {
      //   return Future.error('Preencha os campos corretamente!');
      // }

      final configurationsInfo = ConfigurationsInfoDto(
        enableStatistics: allowDataStorage,
        typography: fontSize,
      );
      
      // 1,popup
      if (notifyPopup) {
        await _configurationsInfoRepository.saveChannel(1);
      } else {
        await _configurationsInfoRepository.removeChannel(1);
      }

      // 2,email
      if (notifyEmail) {
        await _configurationsInfoRepository.saveChannel(2);
      } else {
        await _configurationsInfoRepository.removeChannel(2);
      }

      // 3,whatsapp
      if (notifyWhatsapp) {
        await _configurationsInfoRepository.saveChannel(3);
      } else {
        await _configurationsInfoRepository.removeChannel(3);
      }

      final ConfigurationsInfoDto dataResponse = await _configurationsInfoRepository.exec(configurationsInfo);

      return dataResponse;
    } catch (e) {
      return Future.error(e.toString());
    }
  }
}
