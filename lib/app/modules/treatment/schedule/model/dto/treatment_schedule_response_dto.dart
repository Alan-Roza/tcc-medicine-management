class TreatmentScheduleResponseDto {
  List<Medicines>? medicines;
  String? user;

  TreatmentScheduleResponseDto({this.medicines, this.user});

  TreatmentScheduleResponseDto.fromJson(Map<String, dynamic> json) {
    if (json['medicines'] != null) {
      medicines = <Medicines>[];
      json['medicines'].forEach((v) {
        medicines!.add(Medicines.fromJson(v));
      });
    }
    user = json['user'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (medicines != null) {
      data['medicines'] = medicines!.map((v) => v.toJson()).toList();
    }
    data['user'] = user;
    return data;
  }
}

class Medicines {
  String? importance;
  String? medicineName;
  String? treatmentName;
  List<String>? pictures;

  Medicines(
      {this.importance, this.medicineName, this.treatmentName, this.pictures});

  Medicines.fromJson(Map<String, dynamic> json) {
    importance = json['importance'];
    medicineName = json['medicineName'];
    treatmentName = json['treatmentName'];
    pictures = json['pictures'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['importance'] = importance;
    data['medicineName'] = medicineName;
    data['treatmentName'] = treatmentName;
    data['pictures'] = pictures;
    return data;
  }
}
