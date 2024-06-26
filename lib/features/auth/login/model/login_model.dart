import 'package:technicmate/common/models/models.dart';
import 'package:technicmate/features/auth/login/model/login_response_model.dart';

class LoginModel {
  bool? success;
  LoginDataResponeModel? data;
  ErrorModel? error;

  LoginModel({this.success, this.data, this.error});

  LoginModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    data = json['data'] != null
        ? LoginDataResponeModel.fromJson(json['data'])
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
