class ResumeDailyResponseDto {
  List<Treatments>? treatments;
  int? total;
  int? consumed;
  int? delayed;
  int? normal;

  ResumeDailyResponseDto(
      {this.treatments, this.total, this.consumed, this.delayed, this.normal});

  ResumeDailyResponseDto.fromJson(Map<String, dynamic> json) {
    if (json['treatments'] != null) {
      treatments = <Treatments>[];
      json['treatments'].forEach((v) {
        treatments!.add(Treatments.fromJson(v));
      });
    }
    total = json['total'];
    consumed = json['consumed'];
    delayed = json['delayed'];
    normal = json['normal'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (treatments != null) {
      data['treatments'] = treatments!.map((v) => v.toJson()).toList();
    }
    data['total'] = total;
    data['consumed'] = consumed;
    data['delayed'] = delayed;
    data['normal'] = normal;
    return data;
  }
}

class Treatments {
  String? name;
  List<Medicines>? medicines;

  Treatments({this.name, this.medicines});

  Treatments.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    if (json['medicines'] != null) {
      medicines = <Medicines>[];
      json['medicines'].forEach((v) {
        medicines!.add(Medicines.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    if (medicines != null) {
      data['medicines'] = medicines!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Medicines {
  String? name;
  String? status;

  Medicines({this.name, this.status});

  Medicines.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['status'] = status;
    return data;
  }
}
