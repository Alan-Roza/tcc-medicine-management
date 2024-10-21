class MedicineListDto {
  String? name;
  int? id;
  String? type;
  String? importance;
  double? price;
  String? hardwareId;
  int? storageQuantity;
  String? expirationDate;
  int? drawerNumber;
  bool? removed;
  List<String>? urlImages;

  MedicineListDto(
      {this.name,
      this.id,
      this.type,
      this.importance,
      this.price,
      this.hardwareId,
      this.storageQuantity,
      this.expirationDate,
      this.drawerNumber,
      this.removed,
      this.urlImages});

  MedicineListDto.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    id = json['id'];
    type = json['type'];
    importance = json['importance'];
    price = json['price'];
    hardwareId = json['hardwareId'];
    storageQuantity = json['storageQuantity'];
    expirationDate = json['expirationDate'];
    drawerNumber = json['drawerNumber'];
    removed = json['removed'];
    urlImages = json['urlImages'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['id'] = id;
    data['type'] = type;
    data['importance'] = importance;
    data['price'] = price;
    data['hardwareId'] = hardwareId;
    data['storageQuantity'] = storageQuantity;
    data['expirationDate'] = expirationDate;
    data['drawerNumber'] = drawerNumber;
    data['removed'] = removed;
    data['urlImages'] = urlImages;
    return data;
  }
}
