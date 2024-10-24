class PatientListResponseDto {
  String? user;
  List<Patients>? patients;

  PatientListResponseDto({this.user, this.patients});

  PatientListResponseDto.fromJson(Map<String, dynamic> json) {
    user = json['user'];
    if (json['patients'] != null) {
      patients = <Patients>[];
      json['patients'].forEach((v) {
        patients!.add(Patients.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['user'] = user;
    if (patients != null) {
      data['patients'] = patients!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Patients {
  Null lastAccess;
  String? name;
  String? telephone;
  String? gender;
  String? birthdate;

  Patients(
      {this.lastAccess,
      this.name,
      this.telephone,
      this.gender,
      this.birthdate});

  Patients.fromJson(Map<String, dynamic> json) {
    lastAccess = json['lastAccess'];
    name = json['name'];
    telephone = json['telephone'];
    gender = json['gender'];
    birthdate = json['birthdate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['lastAccess'] = lastAccess;
    data['name'] = name;
    data['telephone'] = telephone;
    data['gender'] = gender;
    data['birthdate'] = birthdate;
    return data;
  }
}
