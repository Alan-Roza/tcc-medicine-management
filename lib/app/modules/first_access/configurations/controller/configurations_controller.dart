import 'package:mobx/mobx.dart';
import 'package:tcc_medicine_management/app/modules/first_access/configurations/model/dto/channels_response_dto.dart';
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
  Future<void> getConfigurations() async {
    try {
      final ChannelsResponseDto channelsResponse = await _configurationsInfoRepository.getChannels();
      final ConfigurationsInfoDto preferencesResponse = await _configurationsInfoRepository.getPreferences();

      allowDataStorage = preferencesResponse.enableStatistics ?? false;
      fontSize = preferencesResponse.typography?.toLowerCase() ?? 'normal';

      notifyPopup = channelsResponse.channels!.any((channel) => channel.name == 'popup');
      notifyEmail = channelsResponse.channels!.any((channel) => channel.name == 'email');
      notifyWhatsapp = channelsResponse.channels!.any((channel) => channel.name == 'whatsapp');
    } catch (e) {
      return Future.error(e.toString());
    }
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

      final ChannelsResponseDto channelsResponse = await _configurationsInfoRepository.getChannels();

      List<Channels> channels = channelsResponse.channels!.toList();
      List<Channels> isNotifyPopup = channels.where((channel) => channel.name == 'popup').toList();
      List<Channels> isNotifyEmail = channels.where((channel) => channel.name == 'email').toList();
      List<Channels> isNotifyWhatsapp = channels.where((channel) => channel.name == 'whatsapp').toList();
      
      // 1,popup
      if (notifyPopup) {
        if (isNotifyPopup.isEmpty) {
          await _configurationsInfoRepository.saveChannel(1);
        }
      } else {
        // isNotifyPopup.isNotEmpty? await _configurationsInfoRepository.removeChannel(isNotifyPopup[0].id ?? 0) : null;
        isNotifyPopup.isNotEmpty? await _configurationsInfoRepository.removeChannel(1) : null;
      }

      // 2,email
      if (notifyEmail) {
        if (isNotifyEmail.isEmpty) {
          await _configurationsInfoRepository.saveChannel(2);
        }
      } else {
        // isNotifyEmail.isNotEmpty ? await _configurationsInfoRepository.removeChannel(isNotifyEmail[0].id ?? 0) : null;
        isNotifyEmail.isNotEmpty ? await _configurationsInfoRepository.removeChannel(2) : null;
      }

      // 3,whatsapp
      if (notifyWhatsapp) {
        if (isNotifyWhatsapp.isEmpty) {
          await _configurationsInfoRepository.saveChannel(3);
        }
      } else {
        // isNotifyWhatsapp.isNotEmpty ? await _configurationsInfoRepository.removeChannel(isNotifyWhatsapp[0].id ?? 0) : null;
        isNotifyWhatsapp.isNotEmpty ? await _configurationsInfoRepository.removeChannel(3) : null;
      }

      final ConfigurationsInfoDto dataResponse = await _configurationsInfoRepository.exec(configurationsInfo);

      return dataResponse;
    } catch (e) {
      return Future.error(e.toString());
    }
  }
}
