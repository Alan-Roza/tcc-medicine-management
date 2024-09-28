class MedicineViewResponseDto {
  String? name;
  int? id;
  String? type;
  String? importance;
  String? unitType;
  int? storageQuantity;
  String? expirationDate;
  int? drawerNumber;

  MedicineViewResponseDto(
      {this.name,
      this.id,
      this.type,
      this.importance,
      this.unitType,
      this.storageQuantity,
      this.expirationDate,
      this.drawerNumber});

  MedicineViewResponseDto.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    id = json['id'];
    type = json['type'];
    importance = json['importance'];
    unitType = json['unitType'];
    storageQuantity = json['storageQuantity'];
    expirationDate = json['expirationDate'];
    drawerNumber = json['drawerNumber'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['id'] = id;
    data['type'] = type;
    data['importance'] = importance;
    data['unitType'] = unitType;
    data['storageQuantity'] = storageQuantity;
    data['expirationDate'] = expirationDate;
    data['drawerNumber'] = drawerNumber;
    return data;
  }
}
