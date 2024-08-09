class PropertiesModel {
  List<Data>? data;

  PropertiesModel({this.data});

  PropertiesModel.fromJson(Map<String, dynamic> json) {
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
  String? title;
  String? availableFrom;
  String? rent;
  String? userId;
  String? description;
  String? createdAt;
  String? cityName;
  String? districtName;
  List<Images>? images;
  User? user;

  Data(
      {this.id,
        this.title,
        this.availableFrom,
        this.rent,
        this.userId,
        this.description,
        this.createdAt,
        this.cityName,
        this.districtName,
        this.images,
        this.user});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    availableFrom = json['available_from'];
    rent = json['rent'];
    userId = json['user_id'];
    description = json['description'];
    createdAt = json['created_at'];
    cityName = json['city_name'];
    districtName = json['district_name'];
    if (json['images'] != null) {
      images = <Images>[];
      json['images'].forEach((v) {
        images!.add(new Images.fromJson(v));
      });
    }
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['available_from'] = this.availableFrom;
    data['rent'] = this.rent;
    data['user_id'] = this.userId;
    data['description'] = this.description;
    data['created_at'] = this.createdAt;
    data['city_name'] = this.cityName;
    data['district_name'] = this.districtName;
    if (this.images != null) {
      data['images'] = this.images!.map((v) => v.toJson()).toList();
    }
    if (this.user != null) {
      data['user'] = this.user!.toJson();
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

class User {
  int? id;
  String? name;
  dynamic image;

  User({this.id, this.name, this.image});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['image'] = this.image;
    return data;
  }
}
