import 'package:mobx/mobx.dart';
import 'package:tcc_medicine_management/app/modules/first_access/administrator_info/model/dto/administrator_info_dto.dart';
import 'package:tcc_medicine_management/app/modules/first_access/administrator_info/model/dto/administrator_request_info_dto.dart';
import 'package:tcc_medicine_management/app/modules/first_access/administrator_info/repository/administrator_info_repository.dart';
import 'package:tcc_medicine_management/main.dart';

part 'administrator_info_controller.g.dart';

class AdministratorInfoController = _AdministratorInfoController with _$AdministratorInfoController;

abstract class _AdministratorInfoController with Store {
  final AdministratorInfoRepository _administratorInfoRepository = getIt<AdministratorInfoRepository>();

  @observable
  String code = '';

  @observable
  String administratorName = '';

  @observable
  String administratorProfilePicture = '';

  @action
  Future<void> onSubmit() async {
    try {
      // // TODO: will be implemented at future
      // if (!formKey.currentState!.validate()) {
      //   return Future.error('Preencha os campos corretamente!');
      // }

      final AdministratorRequestDto data = AdministratorRequestDto(
        otp: code,
      );

      await _administratorInfoRepository.exec(data);
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  @action
  Future<AdministratorInfoResponseDto> getAdministratorInfos(String code) async {
    try {
      final AdministratorRequestDto data = AdministratorRequestDto(
        otp: code,
      );

      final AdministratorInfoResponseDto dataResponse = await _administratorInfoRepository.getAdministratorInfos(data);

      administratorName = dataResponse.name ?? '';
      administratorProfilePicture = dataResponse.profilePicture ?? '';

      return dataResponse;
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  void dispose() {
    code = '';
    administratorName = '';
    administratorProfilePicture = '';
  }
}
