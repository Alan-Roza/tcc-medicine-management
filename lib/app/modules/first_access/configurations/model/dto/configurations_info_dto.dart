class ConfigurationsInfoDto {
  String? typography;
  bool? enableStatistics;

  ConfigurationsInfoDto(
      {this.typography,
      this.enableStatistics});

  ConfigurationsInfoDto.fromJson(Map<String, dynamic> json) {
    typography = json['typography'];
    enableStatistics = json['enableStatistics'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['typography'] = typography;
    data['enableStatistics'] = enableStatistics;
    return data;
  }
}
