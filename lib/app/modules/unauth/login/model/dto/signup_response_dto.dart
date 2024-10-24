class SignupResponseDto {
  String? token;
  String? userLogin;

  SignupResponseDto({this.token});

  SignupResponseDto.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    userLogin = json['userLogin'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['token'] = token;
    data['userLogin'] = userLogin;
    return data;
  }
}