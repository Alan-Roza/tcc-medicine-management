class ConnectionListResponseDto {
  String? name;
  String? hardwareId;
  String? user;
  String? topic;
  int? drawerNumber;

  ConnectionListResponseDto({this.name, this.hardwareId, this.user, this.topic});

  ConnectionListResponseDto.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    hardwareId = json['hardwareId'];
    user = json['user'];
    topic = json['topic'];
    drawerNumber = json['drawerNumber'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['hardwareId'] = hardwareId;
    data['user'] = user;
    data['topic'] = topic;
    data['drawerNumber'] = drawerNumber;
    return data;
  }

  static List<ConnectionListResponseDto> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => ConnectionListResponseDto.fromJson(json)).toList();
  }
}