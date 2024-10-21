class LoginResponseDto {
  String? token;
  String? userName;

  LoginResponseDto({this.token});

  LoginResponseDto.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    userName = json['userName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['token'] = token;
    data['userName'] = userName;
    return data;
  }
}