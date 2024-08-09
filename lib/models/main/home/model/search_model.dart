class SearchModel {
  List<Data>? data;

  SearchModel({this.data});

  SearchModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  String? bedroom;
  String? bathroom;
  String? veranda;
  String? floorNo;
  String? rent;
  String? availableFrom;
  String? additionalPhoneNumber;
  String? status;
  dynamic priorityStatus;
  String? approvedStatus;
  String? description;
  String? facilities;
  String? whatsappNumber;
  String? title;
  String? cityName;
  String? districtName;
  String? userId;
  String? latitude;
  String? longitude;
  List<Images>? images;

  Data(
      {this.id,
        this.bedroom,
        this.bathroom,
        this.veranda,
        this.floorNo,
        this.rent,
        this.availableFrom,
        this.additionalPhoneNumber,
        this.status,
        this.priorityStatus,
        this.approvedStatus,
        this.description,
        this.facilities,
        this.whatsappNumber,
        this.title,
        this.cityName,
        this.districtName,
        this.userId,
        this.latitude,
        this.longitude,
        this.images});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    bedroom = json['bedroom'];
    bathroom = json['bathroom'];
    veranda = json['veranda'];
    floorNo = json['floor_no'];
    rent = json['rent'];
    availableFrom = json['available_from'];
    additionalPhoneNumber = json['additional_phone_number'];
    status = json['status'];
    priorityStatus = json['priority_status'];
    approvedStatus = json['approved_status'];
    description = json['description'];
    facilities = json['facilities'];
    whatsappNumber = json['whatsapp_number'];
    title = json['title'];
    cityName = json['city_name'];
    districtName = json['district_name'];
    userId = json['user_id'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    if (json['images'] != null) {
      images = <Images>[];
      json['images'].forEach((v) {
        images!.add(new Images.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['bedroom'] = this.bedroom;
    data['bathroom'] = this.bathroom;
    data['veranda'] = this.veranda;
    data['floor_no'] = this.floorNo;
    data['rent'] = this.rent;
    data['available_from'] = this.availableFrom;
    data['additional_phone_number'] = this.additionalPhoneNumber;
    data['status'] = this.status;
    data['priority_status'] = this.priorityStatus;
    data['approved_status'] = this.approvedStatus;
    data['description'] = this.description;
    data['facilities'] = this.facilities;
    data['whatsapp_number'] = this.whatsappNumber;
    data['title'] = this.title;
    data['city_name'] = this.cityName;
    data['district_name'] = this.districtName;
    data['user_id'] = this.userId;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    if (this.images != null) {
      data['images'] = this.images!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Images {
  String? title;
  String? propertyId;

  Images({this.title, this.propertyId});

  Images.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    propertyId = json['property_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['property_id'] = this.propertyId;
    return data;
  }
}
