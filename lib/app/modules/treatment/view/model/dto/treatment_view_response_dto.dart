class TreatmentViewResponseDto {
  Treatment? treatment;
  List<Medicines>? medicines;

  TreatmentViewResponseDto({this.treatment, this.medicines});

  TreatmentViewResponseDto.fromJson(Map<String, dynamic> json) {
    treatment = json['treatment'] != null
        ? Treatment.fromJson(json['treatment'])
        : null;
    if (json['medicines'] != null) {
      medicines = <Medicines>[];
      json['medicines'].forEach((v) {
        medicines!.add(Medicines.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (treatment != null) {
      data['treatment'] = treatment!.toJson();
    }
    if (medicines != null) {
      data['medicines'] = medicines!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Treatment {
  String? name;
  int? id;
  String? user;
  String? importance;

  Treatment({this.name, this.id, this.user, this.importance});

  Treatment.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    id = json['id'];
    user = json['user'];
    importance = json['importance'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['id'] = id;
    data['user'] = user;
    data['importance'] = importance;
    return data;
  }
}

class Medicines {
  String? medicineId;
  int? frequency;
  String? treatmentEnd;
  String? treatmentInit;
  int? dosage;
  String? medicine;

  Medicines(
      {this.medicineId,
      this.frequency,
      this.treatmentEnd,
      this.treatmentInit,
      this.dosage,
      this.medicine});

  Medicines.fromJson(Map<String, dynamic> json) {
    medicine = json['Medicine'];
    frequency = json['frequency'];
    treatmentEnd = json['treatmentEnd'];
    treatmentInit = json['treatmentInit'];
    dosage = json['dosage'];
    medicine = json['medicine'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Medicine'] = medicine;
    data['frequency'] = frequency;
    data['treatmentEnd'] = treatmentEnd;
    data['treatmentInit'] = treatmentInit;
    data['dosage'] = dosage;
    data['medicine'] = medicine;
    return data;
  }
}
