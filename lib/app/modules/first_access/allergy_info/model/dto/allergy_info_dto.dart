class AllergyInfoDto {
  String? allergy;

  AllergyInfoDto({this.allergy});

  AllergyInfoDto.fromJson(Map<String, dynamic> json) {
    allergy = json['allergy'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['allergy'] = allergy;
    return data;
  }
}
