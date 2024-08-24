class DistrictListModel {
  String? status;
  List<DistrictListData>? data;

  DistrictListModel({this.status, this.data});

  DistrictListModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <DistrictListData>[];
      json['data'].forEach((v) {
        data!.add(new DistrictListData.fromJson(v));
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

class DistrictListData {
  int? id;
  String? name;
  String? divisionId;

  DistrictListData({this.id, this.name, this.divisionId});

  DistrictListData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    divisionId = json['division_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['division_id'] = this.divisionId;
    return data;
  }
}
