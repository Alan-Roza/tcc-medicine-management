class MedicineListRequestDto {
  int? userId;
  int? page;
  int? size;
  List<String>? sort;

  MedicineListRequestDto({this.userId, this.page, this.size, this.sort});

  MedicineListRequestDto.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    page = json['page'];
    size = json['size'];
    sort = json['sort'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userId'] = userId;
    data['page'] = page;
    data['size'] = size;
    data['sort'] = sort;
    return data;
  }
}