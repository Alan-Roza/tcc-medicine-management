class MedicineViewResponseDto {
  String? name;
  int? id;
  String? type;
  String? hardwareId;
  String? importance;
  int? storageQuantity;
  String? expirationDate;
  double? price;
  int? drawerNumber;
  bool? removed;

  MedicineViewResponseDto(
      {this.name,
      this.id,
      this.type,
      this.hardwareId,
      this.importance,
      this.storageQuantity,
      this.expirationDate,
      this.price,
      this.drawerNumber,
      this.removed});

  MedicineViewResponseDto.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    id = json['id'];
    type = json['type'];
    hardwareId = json['hardwareId'];
    importance = json['importance'];
    storageQuantity = json['storageQuantity'];
    expirationDate = json['expirationDate'];
    price = json['price'];
    drawerNumber = json['drawerNumber'];
    removed = json['removed'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['id'] = id;
    data['type'] = type;
    data['hardwareId'] = hardwareId;
    data['importance'] = importance;
    data['storageQuantity'] = storageQuantity;
    data['expirationDate'] = expirationDate;
    data['price'] = price;
    data['drawerNumber'] = drawerNumber;
    data['removed'] = removed;
    return data;
  }
}
