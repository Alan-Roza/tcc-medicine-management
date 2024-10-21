class TreatmentListDto {
  Resume? resume;
  String? name;
  int? id;
  String? user;
  String? importance;

  TreatmentListDto(
      {this.resume, this.name, this.id, this.user, this.importance});

  TreatmentListDto.fromJson(Map<String, dynamic> json) {
    resume =
        json['resume'] != null ? Resume.fromJson(json['resume']) : null;
    name = json['name'];
    id = json['id'];
    user = json['user'];
    importance = json['importance'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (resume != null) {
      data['resume'] = resume!.toJson();
    }
    data['name'] = name;
    data['id'] = id;
    data['user'] = user;
    data['importance'] = importance;
    return data;
  }
}

class Resume {
  int? medicineQuantity;
  String? lastEndDate;
  String? firstInitDate;
  double? totalPrice;

  Resume(
      {this.medicineQuantity,
      this.lastEndDate,
      this.firstInitDate,
      this.totalPrice});

  Resume.fromJson(Map<String, dynamic> json) {
    medicineQuantity = json['medicineQuantity'];
    lastEndDate = json['lastEndDate'];
    firstInitDate = json['firstInitDate'];
    totalPrice = json['totalPrice'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['medicineQuantity'] = medicineQuantity;
    data['lastEndDate'] = lastEndDate;
    data['firstInitDate'] = firstInitDate;
    data['totalPrice'] = totalPrice;
    return data;
  }
}
