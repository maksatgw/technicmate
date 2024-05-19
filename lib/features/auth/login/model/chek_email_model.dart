import 'package:technicmate/features/auth/model/error_model.dart';
import 'package:technicmate/features/auth/model/university_model.dart';

class CheckEmailModel {
  bool? success;
  Data? data;
  Error? error;

  CheckEmailModel({this.success, this.data, this.error});

  CheckEmailModel.fromJson(Map<String, dynamic> json) {
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
  bool? isLogin;
  bool? isRegister;
  String? email;
  String? rootMail;
  String? studentMail;
  University? university;

  Data({this.isLogin, this.isRegister, this.email, this.rootMail, this.studentMail, this.university});

  Data.fromJson(Map<String, dynamic> json) {
    isLogin = json['is_login'];
    isRegister = json['is_register'];
    email = json['email'];
    rootMail = json['root_mail'];
    studentMail = json['student_mail'];
    university = json['university'] != null ? new University.fromJson(json['university']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['is_login'] = this.isLogin;
    data['is_register'] = this.isRegister;
    data['email'] = this.email;
    data['root_mail'] = this.rootMail;
    data['student_mail'] = this.studentMail;
    if (this.university != null) {
      data['university'] = this.university!.toJson();
    }
    return data;
  }
}
