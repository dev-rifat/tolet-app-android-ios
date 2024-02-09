class ErrorModel {
  String? message;
  String? error;

  ErrorModel({this.message});

  ErrorModel.fromJson(Map<String, dynamic> json) {
    message = json['error'];
    error = json['message'];
  }
}




class SignupErrorModel {
  Errors? errors;

  SignupErrorModel({this.errors});

  SignupErrorModel.fromJson(Map<String, dynamic> json) {
    errors =
    json['errors'] != null ? new Errors.fromJson(json['errors']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.errors != null) {
      data['errors'] = this.errors!.toJson();
    }
    return data;
  }
}

class Errors {
  List<String>? firstName;
  List<String>? lastName;
  List<String>? email;
  List<String>? address;
  List<String>? city;
  List<String>? state;
  List<String>? mobileNumber;
  List<String>? password;
  List<String>? confirmPassword;

  Errors(
      {this.firstName,
        this.lastName,
        this.email,
        this.address,
        this.city,
        this.state,
        this.mobileNumber,
        this.password,
        this.confirmPassword});

  Errors.fromJson(Map<String, dynamic> json) {
    firstName = json['first_name'].cast<String>();
    lastName = json['last_name'].cast<String>();
    email = json['email'].cast<String>();
    address = json['address'].cast<String>();
    city = json['city'].cast<String>();
    state = json['state'].cast<String>();
    mobileNumber = json['mobile_number'].cast<String>();
    password = json['password'].cast<String>();
    confirmPassword = json['confirm_password'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['email'] = this.email;
    data['address'] = this.address;
    data['city'] = this.city;
    data['state'] = this.state;
    data['mobile_number'] = this.mobileNumber;
    data['password'] = this.password;
    data['confirm_password'] = this.confirmPassword;
    return data;
  }
}
