class UserInfoDto {
  String? name;
  String? email;
  String? birthdate;
  String? telephone;
  String? gender;

  UserInfoDto(
      {this.name, this.email, this.birthdate, this.telephone, this.gender});

  UserInfoDto.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    birthdate = json['birthdate'];
    telephone = json['telephone'];
    gender = json['gender'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['birthdate'] = birthdate;
    data['telephone'] = '55$telephone';
    data['gender'] = gender;
    return data;
  }
}