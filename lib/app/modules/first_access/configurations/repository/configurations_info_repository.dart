import 'package:tcc_medicine_management/app/core/infra/api_service.dart';
import 'package:tcc_medicine_management/app/core/infra/error_handler.dart';
import 'package:tcc_medicine_management/app/core/infra/network_info.dart';
import 'package:tcc_medicine_management/app/modules/first_access/configurations/model/dto/channels_response_dto.dart';
import 'package:tcc_medicine_management/app/modules/first_access/configurations/model/dto/configurations_info_dto.dart';
import 'package:tcc_medicine_management/app/modules/first_access/configurations/model/repository/configurations_info_repository.dart';

class ConfigurationsInfoRepository implements IConfigurationsInfoRepository {
  final NetworkInfo _networkInfo;
  final ApiService _apiService;

  ConfigurationsInfoRepository(this._networkInfo, this._apiService);

  @override
  Future<ConfigurationsInfoDto> exec(ConfigurationsInfoDto data) async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _apiService.put(
          endPoint: "/User/Preferences", 
          data: data.toJson()
        );

        final configurations = ConfigurationsInfoDto.fromJson(response.data);
        
      
        return configurations;
      } 
      catch (error) {
        return Future.error(handleError(error));
      }
    } else {
      // Throws an exception when there is no internet connection
      return Future.error("Verifique o acesso à internet");
    }
  }

  @override
  Future<ChannelsResponseDto> getChannels() async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _apiService.get(
          endPoint: "/User/Channel"
        );

        final channels = ChannelsResponseDto.fromJson(response.data);
        
      
        return channels;
      } 
      catch (error) {
        return Future.error(handleError(error));
      }
    } else {
      // Throws an exception when there is no internet connection
      return Future.error("Verifique o acesso à internet");
    }
  }

  @override
  Future<ConfigurationsInfoDto> getPreferences() async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _apiService.get(
          endPoint: "/User/Preferences"
        );

        final configurations = ConfigurationsInfoDto.fromJson(response.data);
        
      
        return configurations;
      } 
      catch (error) {
        return Future.error(handleError(error));
      }
    } else {
      // Throws an exception when there is no internet connection
      return Future.error("Verifique o acesso à internet");
    }
  }

  @override
  Future<void> saveChannel(int channelId) async {
    if (await _networkInfo.isConnected) {
      try {
        await _apiService.post(
          endPoint: "/User/Channel", 
            data: {"channelId": channelId}
        );
      } 
      catch (error) {
        return Future.error(handleError(error));
      }
    } else {
      // Throws an exception when there is no internet connection
      return Future.error("Verifique o acesso à internet");
    }
  }

  @override
  Future<void> removeChannel(int channelId) async {
    if (await _networkInfo.isConnected) {
      try {
        await _apiService.delete(
          endPoint: "/User/Channel/$channelId",
        );
      } 
      catch (error) {
        return Future.error(handleError(error));
      }
    } else {
      // Throws an exception when there is no internet connection
      return Future.error("Verifique o acesso à internet");
    }
  }
}
