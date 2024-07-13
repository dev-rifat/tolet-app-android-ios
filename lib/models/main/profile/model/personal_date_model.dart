class PersonalDateModel {
  User? user;

  PersonalDateModel({this.user});

  PersonalDateModel.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }
}

class User {
  String? personalDate;

  User({this.personalDate});

  User.fromJson(Map<String, dynamic> json) {
    personalDate = json['personal_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['personal_date'] = this.personalDate;
    return data;
  }
}
