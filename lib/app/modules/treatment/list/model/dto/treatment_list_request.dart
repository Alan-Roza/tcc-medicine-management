class TreatmentListRequestDto {
  int? userId;
  int? page;
  int? size;
  List<String>? sort;
  String? search;

  TreatmentListRequestDto({this.userId, this.page, this.size, this.sort, this.search});

  TreatmentListRequestDto.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    page = json['page'];
    size = json['size'];
    sort = json['sort'].cast<String>();
    search = json['search'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userId'] = userId;
    data['page'] = page;
    data['size'] = size;
    data['sort'] = sort;
    data['search'] = search;
    return data;
  }
}
