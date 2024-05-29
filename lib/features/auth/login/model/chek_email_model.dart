import 'package:technicmate/common/models/error_model.dart';
import 'package:technicmate/common/models/university_model.dart';

class CheckEmailModel {
  bool? success;
  ChekEmailResponseDataModel? data;
  ErrorModel? error;

  CheckEmailModel({this.success, this.data, this.error});

  CheckEmailModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    data = json['data'] != null
        ? ChekEmailResponseDataModel.fromJson(json['data'])
        : null;
    error = json['error'] != null ? ErrorModel.fromJson(json['error']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    if (error != null) {
      data['error'] = error!.toJson();
    }
    return data;
  }
}

class ChekEmailResponseDataModel {
  bool? isLogin;
  bool? isRegister;
  String? email;
  String? rootMail;
  String? studentMail;
  University? university;
  String? profileImage;
  ChekEmailResponseDataModel(
      {this.isLogin,
      this.isRegister,
      this.email,
      this.rootMail,
      this.studentMail,
      this.university,
      this.profileImage});

  ChekEmailResponseDataModel.fromJson(Map<String, dynamic> json) {
    isLogin = json['is_login'];
    isRegister = json['is_register'];
    email = json['email'];
    rootMail = json['root_mail'];
    studentMail = json['student_mail'];
    profileImage = json['profile_image_data'];
    university = json['university'] != null
        ? University.fromJson(json['university'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['is_login'] = isLogin;
    data['is_register'] = isRegister;
    data['email'] = email;
    data['root_mail'] = rootMail;
    data['student_mail'] = studentMail;
    if (university != null) {
      data['university'] = university!.toJson();
    }
    return data;
  }
}
