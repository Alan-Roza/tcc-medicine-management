class ChannelsResponseDto {
  String? userName;
  List<Channels>? channels;

  ChannelsResponseDto({this.userName, this.channels});

  ChannelsResponseDto.fromJson(Map<String, dynamic> json) {
    userName = json['userName'];
    if (json['channels'] != null) {
      channels = <Channels>[];
      json['channels'].forEach((v) {
        channels!.add(Channels.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userName'] = userName;
    if (channels != null) {
      data['channels'] = channels!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Channels {
  String? name;
  int? id;

  Channels({this.name, this.id});

  Channels.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['id'] = id;
    return data;
  }
}
