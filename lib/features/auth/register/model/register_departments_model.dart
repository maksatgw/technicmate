import 'package:technicmate/common/models/models.dart';

class RegisterDepartmentModel {
  bool? succes;
  List<DepartmentModel>? data;
  ErrorModel? error;

  RegisterDepartmentModel({this.succes, this.data, this.error});

  RegisterDepartmentModel.fromJson(Map<String, dynamic> json) {
    succes = json['succes'];
    if (json['data'] != null) {
      data = <DepartmentModel>[];
      json['data'].forEach((v) {
        data!.add(DepartmentModel.fromJson(v));
      });
    }
    error = json['error'] != null ? ErrorModel.fromJson(json['error']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['succes'] = succes;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    if (error != null) {
      data['error'] = error!.toJson();
    }
    return data;
  }
}
