class MedicineViewRequestDto {
  int? medicineId;
  int? userId;

  MedicineViewRequestDto({this.medicineId, this.userId});

  MedicineViewRequestDto.fromJson(Map<String, dynamic> json) {
    medicineId = json['medicineId'];
    userId = json['userId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['medicineId'] = medicineId;
    data['userId'] = userId;
    return data;
  }
}
