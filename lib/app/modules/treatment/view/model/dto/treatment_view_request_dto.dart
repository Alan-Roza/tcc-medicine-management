class TreatmentViewRequestDto {
  int? treatmentId;
  int? userId;

  TreatmentViewRequestDto({this.treatmentId, this.userId});

  TreatmentViewRequestDto.fromJson(Map<String, dynamic> json) {
    treatmentId = json['treatmentId'];
    userId = json['userId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['treatmentId'] = treatmentId;
    data['userId'] = userId;
    return data;
  }
}
