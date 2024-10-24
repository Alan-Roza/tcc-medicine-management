class ResumePendencyResponseDto {
  bool? hasPendency;

  ResumePendencyResponseDto({this.hasPendency});

  ResumePendencyResponseDto.fromJson(Map<String, dynamic> json) {
    hasPendency = json['hasPendency'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['hasPendency'] = hasPendency;
    return data;
  }
}
