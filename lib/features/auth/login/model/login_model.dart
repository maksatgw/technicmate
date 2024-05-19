import 'package:technicmate/features/auth/model/error_model.dart';
import 'package:technicmate/features/auth/model/user_model.dart';

class LoginModel {
  bool? success;
  Data? data;
  Error? error;

  LoginModel({this.success, this.data, this.error});

  LoginModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    error = json['error'] != null ? new Error.fromJson(json['error']) : null;
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
  String? token;
  String? userTypeId;
  String? userId;
  User? user;
  String? validityAt;
  String? createdAt;

  Data({this.token, this.userTypeId, this.userId, this.user, this.validityAt, this.createdAt});

  Data.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    userTypeId = json['user_type_id'];
    userId = json['user_id'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    validityAt = json['validity_at'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = this.token;
    data['user_type_id'] = this.userTypeId;
    data['user_id'] = this.userId;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    data['validity_at'] = this.validityAt;
    data['created_at'] = this.createdAt;
    return data;
  }
}
