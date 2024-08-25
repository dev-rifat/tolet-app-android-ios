class ProfileModel {
  String? status;
  Data? data;

  ProfileModel({this.status, this.data});

  ProfileModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int? id;
  String? name;
  String? email;
  dynamic nidNumber;
  dynamic image;
  dynamic dob;
  String? phoneNumber;
  dynamic presentAddress;
  dynamic permanentAddress;
  dynamic emailVerifiedAt;
  String? role;
  dynamic bloodGroup;
  dynamic donateBlood;
  dynamic latitude;
  dynamic longitude;
  String? createdAt;
  String? updatedAt;

  Data(
      {this.id,
        this.name,
        this.email,
        this.nidNumber,
        this.image,
        this.dob,
        this.phoneNumber,
        this.presentAddress,
        this.permanentAddress,
        this.emailVerifiedAt,
        this.role,
        this.bloodGroup,
        this.donateBlood,
        this.latitude,
        this.longitude,
        this.createdAt,
        this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    nidNumber = json['nid_number'];
    image = json['image'];
    dob = json['dob'];
    phoneNumber = json['phone_number'];
    presentAddress = json['present_address'];
    permanentAddress = json['permanent_address'];
    emailVerifiedAt = json['email_verified_at'];
    role = json['role'];
    bloodGroup = json['blood_group'];
    donateBlood = json['donate_blood'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['nid_number'] = this.nidNumber;
    data['image'] = this.image;
    data['dob'] = this.dob;
    data['phone_number'] = this.phoneNumber;
    data['present_address'] = this.presentAddress;
    data['permanent_address'] = this.permanentAddress;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['role'] = this.role;
    data['blood_group'] = this.bloodGroup;
    data['donate_blood'] = this.donateBlood;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
