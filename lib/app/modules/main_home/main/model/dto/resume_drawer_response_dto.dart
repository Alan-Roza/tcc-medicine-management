class ResumeDrawerResponseDto {
  int? occupied;
  int? total;
  int? available;

  ResumeDrawerResponseDto({this.occupied, this.total, this.available});

  ResumeDrawerResponseDto.fromJson(Map<String, dynamic> json) {
    occupied = json['occupied'];
    total = json['total'];
    available = json['available'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['occupied'] = occupied;
    data['total'] = total;
    data['available'] = available;
    return data;
  }
}
