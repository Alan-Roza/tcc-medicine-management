
class MedicineListResponseDto {
  int? totalPages;
  int? totalElements;
  Pageable? pageable;
  int? size;
  List<Content>? content;
  int? number;
  Sort? sort;
  int? numberOfElements;
  bool? first;
  bool? last;
  bool? empty;

  MedicineListResponseDto(
      {this.totalPages,
      this.totalElements,
      this.pageable,
      this.size,
      this.content,
      this.number,
      this.sort,
      this.numberOfElements,
      this.first,
      this.last,
      this.empty});

  MedicineListResponseDto.fromJson(Map<String, dynamic> json) {
    totalPages = json['totalPages'];
    totalElements = json['totalElements'];
    pageable = json['pageable'] != null
        ? Pageable.fromJson(json['pageable'])
        : null;
    size = json['size'];
    if (json['content'] != null) {
      content = <Content>[];
      json['content'].forEach((v) {
        content!.add(Content.fromJson(v));
      });
    }
    number = json['number'];
    sort = json['sort'] != null ? Sort.fromJson(json['sort']) : null;
    numberOfElements = json['numberOfElements'];
    first = json['first'];
    last = json['last'];
    empty = json['empty'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['totalPages'] = totalPages;
    data['totalElements'] = totalElements;
    if (pageable != null) {
      data['pageable'] = pageable!.toJson();
    }
    data['size'] = size;
    if (content != null) {
      data['content'] = content!.map((v) => v.toJson()).toList();
    }
    data['number'] = number;
    if (sort != null) {
      data['sort'] = sort!.toJson();
    }
    data['numberOfElements'] = numberOfElements;
    data['first'] = first;
    data['last'] = last;
    data['empty'] = empty;
    return data;
  }
}

class Pageable {
  int? pageNumber;
  int? pageSize;
  Sort? sort;
  int? offset;
  bool? paged;
  bool? unpaged;

  Pageable(
      {this.pageNumber,
      this.pageSize,
      this.sort,
      this.offset,
      this.paged,
      this.unpaged});

  Pageable.fromJson(Map<String, dynamic> json) {
    pageNumber = json['pageNumber'];
    pageSize = json['pageSize'];
    sort = json['sort'] != null ? Sort.fromJson(json['sort']) : null;
    offset = json['offset'];
    paged = json['paged'];
    unpaged = json['unpaged'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['pageNumber'] = pageNumber;
    data['pageSize'] = pageSize;
    if (sort != null) {
      data['sort'] = sort!.toJson();
    }
    data['offset'] = offset;
    data['paged'] = paged;
    data['unpaged'] = unpaged;
    return data;
  }
}

class Sort {
  bool? sorted;
  bool? empty;
  bool? unsorted;

  Sort({this.sorted, this.empty, this.unsorted});

  Sort.fromJson(Map<String, dynamic> json) {
    sorted = json['sorted'];
    empty = json['empty'];
    unsorted = json['unsorted'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['sorted'] = sorted;
    data['empty'] = empty;
    data['unsorted'] = unsorted;
    return data;
  }
}

class Content {
  String? name;
  int? id;
  String? type;
  String? unitType;
  String? expirationDate;
  String? importance;
  int? storageQuantity;
  int? drawerNumber;
  double? price;

  Content(
      {this.name,
      this.id,
      this.type,
      this.unitType,
      this.expirationDate,
      this.importance,
      this.storageQuantity,
      this.drawerNumber,
      this.price});

  Content.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    id = json['id'];
    type = json['type'];
    unitType = json['unitType'];
    expirationDate = json['expirationDate'];
    importance = json['importance'];
    storageQuantity = json['storageQuantity'];
    drawerNumber = json['drawerNumber'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['id'] = id;
    data['type'] = type;
    data['unitType'] = unitType;
    data['expirationDate'] = expirationDate;
    data['importance'] = importance;
    data['storageQuantity'] = storageQuantity;
    data['drawerNumber'] = drawerNumber;
    data['price'] = price;
    return data;
  }
}
