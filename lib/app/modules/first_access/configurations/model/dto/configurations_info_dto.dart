class ConfigurationsInfoDto {
  String? typography;
  bool? enableStatistics;
  bool? notifyWhatsapp;
  bool? notifyEmail;
  bool? notifyPopup;

  ConfigurationsInfoDto(
      {this.typography,
      this.enableStatistics,
      this.notifyWhatsapp,
      this.notifyEmail,
      this.notifyPopup});

  ConfigurationsInfoDto.fromJson(Map<String, dynamic> json) {
    typography = json['typography'];
    enableStatistics = json['enableStatistics'];
    notifyWhatsapp = json['notifyWhatsapp'];
    notifyEmail = json['notifyEmail'];
    notifyPopup = json['notifyPopup'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['typography'] = typography;
    data['enableStatistics'] = enableStatistics;
    data['notifyWhatsapp'] = notifyWhatsapp;
    data['notifyEmail'] = notifyEmail;
    data['notifyPopup'] = notifyPopup;
    return data;
  }
}
