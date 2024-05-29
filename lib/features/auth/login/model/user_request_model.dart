class UserRequestModel {
  String? email;
  String? password;

  UserRequestModel({this.email, this.password});

  UserRequestModel.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['email'] = email;
    data['encrypted_password'] = password;
    return data;
  }

  Map<String, dynamic> toCheckEmailJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['email'] = email;
    return data;
  }
}
