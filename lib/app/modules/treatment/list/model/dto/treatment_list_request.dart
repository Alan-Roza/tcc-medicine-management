class TreatmentListRequestDto {
  int? userId;
  int? page;
  int? size;
  String? sortBy;
  String? search;

  TreatmentListRequestDto({this.userId, this.page, this.size, this.sortBy, this.search});

  TreatmentListRequestDto.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    page = json['page'];
    size = json['size'];
    sortBy = json['sortBy'].cast<String>();
    search = json['search'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userId'] = userId;
    data['page'] = page;
    data['size'] = size;
    data['sortBy'] = sortBy;
    data['search'] = search;
    return data;
  }
}
