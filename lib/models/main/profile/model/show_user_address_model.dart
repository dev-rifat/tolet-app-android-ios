class ShowUserAddressModel {
  List<Addresses>? addresses;

  ShowUserAddressModel({this.addresses});

  ShowUserAddressModel.fromJson(Map<String, dynamic> json) {
    if (json['addresses'] != null) {
      addresses = <Addresses>[];
      json['addresses'].forEach((v) {
        addresses!.add(new Addresses.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.addresses != null) {
      data['addresses'] = this.addresses!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Addresses {
  int? id;
  String? userId;
  String? addressCategoryId;
  String? state;
  String? city;
  String? zip;
  String? country;
  String? streetAddress;
  String? longitude;
  String? latitude;
  String? status;
  String? createdAt;
  String? updatedAt;

  Addresses(
      {this.id,
        this.userId,
        this.addressCategoryId,
        this.state,
        this.city,
        this.zip,
        this.country,
        this.streetAddress,
        this.longitude,
        this.latitude,
        this.status,
        this.createdAt,
        this.updatedAt});

  Addresses.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    addressCategoryId = json['address_category_id'];
    state = json['state'];
    city = json['city'];
    zip = json['zip'];
    country = json['country'];
    streetAddress = json['street_address'];
    longitude = json['longitude'];
    latitude = json['latitude'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['address_category_id'] = this.addressCategoryId;
    data['state'] = this.state;
    data['city'] = this.city;
    data['zip'] = this.zip;
    data['country'] = this.country;
    data['street_address'] = this.streetAddress;
    data['longitude'] = this.longitude;
    data['latitude'] = this.latitude;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
