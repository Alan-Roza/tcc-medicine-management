class TreatmentMedicineDto {
  Treatment? treatment;
  List<Medicine>? medicines;

  TreatmentMedicineDto({this.treatment, this.medicines});

  TreatmentMedicineDto.fromJson(Map<String, dynamic> json) {
    treatment = json['treatment'] != null
        ? Treatment.fromJson(json['treatment'])
        : null;
    if (json['medicines'] != null) {
      medicines = <Medicine>[];
      json['medicines'].forEach((v) {
        medicines!.add(Medicine.fromJson(v));
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
  String? importance;

  Treatment({this.name, this.importance});

  Treatment.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    importance = json['importance'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['importance'] = importance;
    return data;
  }
}

class Medicine {
  int? medicineId;
  int? dosage;
  int? frequency;
  String? treatmentEnd;
  String? treatmentInit;
  String? name;

  Medicine(
      {this.medicineId,
      this.dosage,
      this.frequency,
      this.treatmentEnd,
      this.treatmentInit,
      this.name});

  Medicine.fromJson(Map<String, dynamic> json) {
    medicineId = json['medicineId'];
    dosage = json['dosage'];
    frequency = json['frequency'];
    treatmentEnd = json['treatmentEnd'];
    treatmentInit = json['treatmentInit'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['medicineId'] = medicineId;
    data['dosage'] = dosage;
    data['frequency'] = frequency;
    data['treatmentEnd'] = treatmentEnd;
    data['treatmentInit'] = treatmentInit;
    data['name'] = name;
    return data;
  }
}
