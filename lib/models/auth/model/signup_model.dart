class SignUpResponse {
  String? message;
  Data? data;

  SignUpResponse({this.message, this.data});

  SignUpResponse.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    data = json['data'] != null ?  Data.fromJson(json['data']) : null;
  }

}


class Data {
  String? accessToken;
  String? role;
  String? name;

  Data({this.accessToken, this.role, this.name});

  Data.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    role = json['roles'];
    accessToken = json['token'];
  }

}

