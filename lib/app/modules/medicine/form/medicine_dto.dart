class MedicineDto {
  String? name;
  int? id;
  String? type;
  String? unitType;
  String? expirationDate;
  String? importance;
  int? storageQuantity;
  int? drawerNumber;

  MedicineDto(
      {this.name,
      this.id,
      this.type,
      this.unitType,
      this.expirationDate,
      this.importance,
      this.storageQuantity,
      this.drawerNumber});

  MedicineDto.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    id = json['id'];
    type = json['type'];
    unitType = json['unitType'];
    expirationDate = json['expirationDate'];
    importance = json['importance'];
    storageQuantity = json['storageQuantity'];
    drawerNumber = json['drawerNumber'];
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
    return data;
  }
}
