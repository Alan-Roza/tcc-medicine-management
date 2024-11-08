class NotificationParamsDto {
  String? action;
  Params? params;

  NotificationParamsDto({this.action, this.params});

  NotificationParamsDto.fromJson(Map<String, dynamic> json) {
    action = json['Action'];
    params =
        json['params'] != null ? Params.fromJson(json['params']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Action'] = action;
    if (params != null) {
      data['params'] = params!.toJson();
    }
    return data;
  }
}

class Params {
  String? hardwareId;
  int? userId;
  int? medicineId;
  String? medicineName;
  int? treatmentId;
  String? treatmentName;
  String? userName;
  String? datetime;
  String? medicineType;
  int? drawerNumber;
  double? quantity;
  int? type;

  Params(
      {this.hardwareId,
      this.userId,
      this.medicineId,
      this.medicineName,
      this.treatmentId,
      this.treatmentName,
      this.userName,
      this.datetime,
      this.medicineType,
      this.drawerNumber,
      this.quantity,
      this.type});

  Params.fromJson(Map<String, dynamic> json) {
    hardwareId = json['HardwareId'];
    userId = json['UserId'];
    medicineId = json['MedicineId'];
    medicineName = json['MedicineName'];
    treatmentId = json['TreatmentId'];
    treatmentName = json['treatmentName'];
    userName = json['UserName'];
    datetime = json['datetime'];
    medicineType = json['medicineType'];
    drawerNumber = json['DrawerNumber'];
    quantity = json['Quantity'];
    type = json['Type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['HardwareId'] = hardwareId;
    data['UserId'] = userId;
    data['MedicineId'] = medicineId;
    data['MedicineName'] = medicineName;
    data['TreatmentId'] = treatmentId;
    data['treatmentName'] = treatmentName;
    data['UserName'] = userName;
    data['datetime'] = datetime;
    data['medicineType'] = medicineType;
    data['DrawerNumber'] = drawerNumber;
    data['Quantity'] = quantity;
    data['Type'] = type;
    return data;
  }
}
