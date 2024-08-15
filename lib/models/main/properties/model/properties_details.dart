class PropertiesModelDetails {
  Data? data;

  PropertiesModelDetails({this.data});

  PropertiesModelDetails.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (this.data != null) {
      data['data'] = this.data!.toJson();
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
  String? description;
  List<Facilities>? facilities;
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
    description = json['description'];
    facilities = (json['facilities'] as List<dynamic>?)
        ?.map((e) => Facilities.fromJson(e))
        .toList();
    whatsappNumber = json['whatsapp_number'];
    title = json['title'];
    cityName = json['city_name'];
    districtName = json['district_name'];
    userId = json['user_id'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    images = (json['images'] as List<dynamic>?)
        ?.map((e) => Images.fromJson(e))
        .toList();
    images = (json['images'] as List<dynamic>?)
        ?.map((e) => Images.fromJson(e))
        .toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['bedroom'] = bedroom;
    data['bathroom'] = bathroom;
    data['veranda'] = veranda;
    data['floor_no'] = floorNo;
    data['rent'] = rent;
    data['available_from'] = availableFrom;
    data['additional_phone_number'] = additionalPhoneNumber;
    data['description'] = description;
    if (facilities != null) {
      data['facilities'] = facilities!.map((v) => v.toJson()).toList();
    }
    data['whatsapp_number'] = whatsappNumber;
    data['title'] = title;
    data['city_name'] = cityName;
    data['district_name'] = districtName;
    data['user_id'] = userId;
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    if (images != null) {
      data['images'] = images!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Facilities {
  String? propertyId;
  String? title;

  Facilities({this.propertyId, this.title});

  Facilities.fromJson(Map<String, dynamic> json) {
    propertyId = json['property_id'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['property_id'] = propertyId;
    data['title'] = title;
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
    final Map<String, dynamic> data = {};
    data['title'] = title;
    data['property_id'] = propertyId;
    return data;
  }
}

