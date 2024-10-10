class HealthInfoDto {
  double? height;
  double? weight;
  bool? smoking;
  bool? alcohol;
  bool? pregnant;

  HealthInfoDto(
      {this.height, this.weight, this.smoking, this.alcohol, this.pregnant});

  HealthInfoDto.fromJson(Map<String, dynamic> json) {
    height = json['height'];
    weight = json['weight'];
    smoking = json['smoking'];
    alcohol = json['alcohol'];
    pregnant = json['pregnant'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['height'] = height;
    data['weight'] = weight;
    data['smoking'] = smoking;
    data['alcohol'] = alcohol;
    data['pregnant'] = pregnant;
    return data;
  }
}
