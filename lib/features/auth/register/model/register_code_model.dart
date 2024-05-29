import 'package:technicmate/common/models/error_model.dart';

class RegisterCodeModel {
  String? email;
  String? departmentId;

  RegisterCodeModel({this.email, this.departmentId});

  RegisterCodeModel.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    departmentId = json['department_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['department_id'] = this.departmentId;
    return data;
  }
}

class RegisterCodeReturnModel {
  bool? success;
  Data? data;
  ErrorModel? error;

  RegisterCodeReturnModel({this.success, this.data, this.error});

  RegisterCodeReturnModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    error =
        json['error'] != null ? new ErrorModel.fromJson(json['error']) : null;
  }
  RegisterCodeReturnModel.fromJsonRegister(Map<String, dynamic> json) {
    success = json['success'];
    error =
        json['error'] != null ? new ErrorModel.fromJson(json['error']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    if (this.error != null) {
      data['error'] = this.error!.toJson();
    }
    return data;
  }
}

class Data {
  String? email;

  Data({this.email});

  Data.fromJson(Map<String, dynamic> json) {
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    return data;
  }
}

class RegisterModel {
  String? email;
  String? firstname;
  String? lastname;
  String? birthDate;
  int? gender;
  String? departmentId;
  String? encryptedPassword;
  String? completeCode;

  RegisterModel(
      {this.email,
      this.firstname,
      this.lastname,
      this.birthDate,
      this.gender,
      this.departmentId,
      this.encryptedPassword,
      this.completeCode});

  RegisterModel.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    firstname = json['firstname'];
    lastname = json['lastname'];
    birthDate = json['birth_date'];
    gender = json['gender'];
    departmentId = json['department_id'];
    encryptedPassword = json['encrypted_password'];
    completeCode = json['complete_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['firstname'] = this.firstname;
    data['lastname'] = this.lastname;
    data['birth_date'] = this.birthDate;
    data['gender'] = this.gender;
    data['department_id'] = this.departmentId;
    data['encrypted_password'] = this.encryptedPassword;
    data['complete_code'] = this.completeCode;
    return data;
  }
}
