class AdministratorInfoResponseDto {
  String? login;
  String? profilePicture;
  String? name;

  AdministratorInfoResponseDto({this.login, this.profilePicture, this.name});

  AdministratorInfoResponseDto.fromJson(Map<String, dynamic> json) {
    login = json['login'];
    profilePicture = json['profilePicture'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['login'] = login;
    data['profilePicture'] = profilePicture;
    data['name'] = name;
    return data;
  }
}
