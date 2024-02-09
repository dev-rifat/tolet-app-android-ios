class SignInResponse {
  Data? data;

  SignInResponse({this.data});

  SignInResponse.fromJson(Map<String, dynamic> json) {

    data = json['data'] != null ?  Data.fromJson(json['data']) : null;
    print("data ==> $data");
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
