import 'package:technicmate/common/models/error_model.dart';

class RegisterDepartmentModel {
  bool? succes;
  List<Data>? data;
  ErrorModel? error;

  RegisterDepartmentModel({this.succes, this.data, this.error});

  RegisterDepartmentModel.fromJson(Map<String, dynamic> json) {
    succes = json['succes'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
    error =
        json['error'] != null ? new ErrorModel.fromJson(json['error']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['succes'] = this.succes;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    if (this.error != null) {
      data['error'] = this.error!.toJson();
    }
    return data;
  }
}

class Data {
  String? departmentId;
  String? title;
  bool? isActive;
  String? universityId;
  String? createdAt;
  String? updatedAt;

  Data(
      {this.departmentId,
      this.title,
      this.isActive,
      this.universityId,
      this.createdAt,
      this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    departmentId = json['department_id'];
    title = json['title'];
    isActive = json['is_active'];
    universityId = json['university_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['department_id'] = this.departmentId;
    data['title'] = this.title;
    data['is_active'] = this.isActive;
    data['university_id'] = this.universityId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
