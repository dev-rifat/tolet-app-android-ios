class CategoriesModel {
  String? status;
  List<Data>? data;

  CategoriesModel({this.status, this.data});

  CategoriesModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
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

class Data {
  int? id;
  String? name;
  dynamic appIcon;
  dynamic webIcon;

  Data({this.id, this.name, this.appIcon, this.webIcon});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    appIcon = json['app_icon'];
    webIcon = json['web_icon'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['app_icon'] = this.appIcon;
    data['web_icon'] = this.webIcon;
    return data;
  }
}
