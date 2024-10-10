class AddressInfoDto {
  String? state;
  String? zipcode;
  String? street;
  String? neighborhood;
  String? city;

  AddressInfoDto(
      {this.state, this.zipcode, this.street, this.neighborhood, this.city});

  AddressInfoDto.fromJson(Map<String, dynamic> json) {
    state = json['state'];
    zipcode = json['zipcode'];
    street = json['street'];
    neighborhood = json['neighborhood'];
    city = json['city'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['state'] = state;
    data['zipcode'] = zipcode;
    data['street'] = street;
    data['neighborhood'] = neighborhood;
    data['city'] = city;
    return data;
  }
}
