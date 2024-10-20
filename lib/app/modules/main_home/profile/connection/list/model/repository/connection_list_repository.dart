import 'package:tcc_medicine_management/app/modules/main_home/profile/connection/list/model/dto/connection_list_response_dto.dart';

abstract class IConnectionListRepository {
  Future<List<ConnectionListResponseDto>> exec();
  // Future<bool> delete(int id);
}