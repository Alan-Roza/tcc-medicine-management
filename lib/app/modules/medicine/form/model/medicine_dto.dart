class MedicineDto {
  String? name;
  String? type;
  String? importance;
  String? hardwareId;
  int? storageQuantity;
  String? expirationDate;
  double? price;
  int? drawerNumber;
  String? unitType;
  int? id;

  MedicineDto(
      {this.name,
      this.type,
      this.importance,
      this.hardwareId,
      this.storageQuantity,
      this.expirationDate,
      this.price,
      this.drawerNumber,
      this.unitType,
      this.id});

  MedicineDto.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    type = json['type'];
    importance = json['importance'];
    hardwareId = json['hardwareId'];
    storageQuantity = json['storageQuantity'];
    expirationDate = json['expirationDate'];
    price = json['price'];
    drawerNumber = json['drawerNumber'];
    unitType = json['unitType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['type'] = type;
    data['importance'] = importance;
    data['hardwareId'] = hardwareId;
    data['storageQuantity'] = storageQuantity;
    data['expirationDate'] = expirationDate;
    data['price'] = price;
    data['drawerNumber'] = drawerNumber;
    data['unitType'] = unitType;
    return data;
  }
}
