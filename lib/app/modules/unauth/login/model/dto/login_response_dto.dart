class LoginResponseDto {
  String? token;
  String? userName;
  String? userLogin;

  LoginResponseDto({this.token});

  LoginResponseDto.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    userName = json['userName'];
    userLogin = json['userLogin'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['token'] = token;
    data['userName'] = userName;
    data['userLogin'] = userLogin;
    return data;
  }
}