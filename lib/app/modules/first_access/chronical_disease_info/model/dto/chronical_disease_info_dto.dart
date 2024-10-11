class ChronicalDiseaseInfoDto {
  String? disease;

  ChronicalDiseaseInfoDto({this.disease});

  ChronicalDiseaseInfoDto.fromJson(Map<String, dynamic> json) {
    disease = json['disease'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['disease'] = disease;
    return data;
  }
}
