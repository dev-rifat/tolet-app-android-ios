class CityListModel {

  String? status;
  List<CityListData>? data;


  CityListModel({this.status, this.data});

  CityListModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <CityListData>[];
      json['data'].forEach((v) {
        data!.add(new CityListData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CityListData {
  int? id;
  String? name;
  String? districtId;

  CityListData({this.id, this.name, this.districtId});

  CityListData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    districtId = json['district_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['district_id'] = this.districtId;
    return data;
  }
}
