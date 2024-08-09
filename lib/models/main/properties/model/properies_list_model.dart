class PropertiesModel {
  PropertyData? data;

  PropertiesModel({this.data});

  PropertiesModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? PropertyData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> result = {};
    if (data != null) {
      result['data'] = data!.toJson();
    }
    return result;
  }
}

class PropertyData {
  int? currentPage;
  List<Property>? properties;
  String? firstPageUrl;
  int? from;
  int? lastPage;
  String? lastPageUrl;
  List<Links>? links;
  String? nextPageUrl;
  String? path;
  int? perPage;
  String? prevPageUrl;
  int? to;
  int? total;

  PropertyData(
      {this.currentPage,
        this.properties,
        this.firstPageUrl,
        this.from,
        this.lastPage,
        this.lastPageUrl,
        this.links,
        this.nextPageUrl,
        this.path,
        this.perPage,
        this.prevPageUrl,
        this.to,
        this.total});

  PropertyData.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    if (json['data'] != null) {
      properties = [];
      json['data'].forEach((v) {
        properties!.add(Property.fromJson(v));
      });
    }
    firstPageUrl = json['first_page_url'];
    from = json['from'];
    lastPage = json['last_page'];
    lastPageUrl = json['last_page_url'];
    if (json['links'] != null) {
      links = [];
      json['links'].forEach((v) {
        links!.add(Links.fromJson(v));
      });
    }
    nextPageUrl = json['next_page_url'];
    path = json['path'];
    perPage = json['per_page'];
    prevPageUrl = json['prev_page_url'];
    to = json['to'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> result = {};
    result['current_page'] = currentPage;
    if (properties != null) {
      result['data'] = properties!.map((v) => v.toJson()).toList();
    }
    result['first_page_url'] = firstPageUrl;
    result['from'] = from;
    result['last_page'] = lastPage;
    result['last_page_url'] = lastPageUrl;
    if (links != null) {
      result['links'] = links!.map((v) => v.toJson()).toList();
    }
    result['next_page_url'] = nextPageUrl;
    result['path'] = path;
    result['per_page'] = perPage;
    result['prev_page_url'] = prevPageUrl;
    result['to'] = to;
    result['total'] = total;
    return result;
  }
}

class Property {
  int? id;
  String? title;
  String? facilities;
  String? whatsappNumber;
  String? bedroom;
  String? bathroom;
  String? veranda;
  String? floorNo;
  String? gender;
  String? rent;
  String? availableFrom;
  String? additionalPhoneNumber;
  String? approvedStatus;
  String? description;
  String? categoryId;
  String? cityId;
  String? userId;
  User? user;
  List<Images>? images;

  Property(
      {this.id,
        this.title,
        this.facilities,
        this.whatsappNumber,
        this.bedroom,
        this.bathroom,
        this.veranda,
        this.floorNo,
        this.gender,
        this.rent,
        this.availableFrom,
        this.additionalPhoneNumber,
        this.approvedStatus,
        this.description,
        this.categoryId,
        this.cityId,
        this.userId,
        this.user,
        this.images});

  Property.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    facilities = json['facilities'];
    whatsappNumber = json['whatsapp_number'];
    bedroom = json['bedroom'];
    bathroom = json['bathroom'];
    veranda = json['veranda'];
    floorNo = json['floor_no'];
    gender = json['gender'];
    rent = json['rent'];
    availableFrom = json['available_from'];
    additionalPhoneNumber = json['additional_phone_number'];
    approvedStatus = json['approved_status'];
    description = json['description'];
    categoryId = json['category_id'];
    cityId = json['city_id'];
    userId = json['user_id'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    if (json['images'] != null) {
      images = [];
      json['images'].forEach((v) {
        images!.add(Images.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> result = {};
    result['id'] = id;
    result['title'] = title;
    result['facilities'] = facilities;
    result['whatsapp_number'] = whatsappNumber;
    result['bedroom'] = bedroom;
    result['bathroom'] = bathroom;
    result['veranda'] = veranda;
    result['floor_no'] = floorNo;
    result['gender'] = gender;
    result['rent'] = rent;
    result['available_from'] = availableFrom;
    result['additional_phone_number'] = additionalPhoneNumber;
    result['approved_status'] = approvedStatus;
    result['description'] = description;
    result['category_id'] = categoryId;
    result['city_id'] = cityId;
    result['user_id'] = userId;
    if (user != null) {
      result['user'] = user!.toJson();
    }
    if (images != null) {
      result['images'] = images!.map((v) => v.toJson()).toList();
    }
    return result;
  }
}

class User {
  int? id;
  String? name;
  String? phoneNumber;
  String? image;

  User({this.id, this.name, this.phoneNumber, this.image});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    phoneNumber = json['phone_number'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> result = {};
    result['id'] = id;
    result['name'] = name;
    result['phone_number'] = phoneNumber;
    result['image'] = image;
    return result;
  }
}

class Images {
  int? id;
  String? title;
  String? propertyId;

  Images({this.id, this.title, this.propertyId});

  Images.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    propertyId = json['property_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> result = {};
    result['id'] = id;
    result['title'] = title;
    result['property_id'] = propertyId;
    return result;
  }
}

class Links {
  String? url;
  String? label;
  bool? active;

  Links({this.url, this.label, this.active});

  Links.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    label = json['label'];
    active = json['active'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> result = {};
    result['url'] = url;
    result['label'] = label;
    result['active'] = active;
    return result;
  }
}
