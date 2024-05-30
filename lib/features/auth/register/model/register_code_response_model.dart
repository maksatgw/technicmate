import 'package:technicmate/common/models/models.dart';

class RegisterCodeReturnModel {
  bool? success;
  RegisterCodeReturnDataModel? data;
  ErrorModel? error;

  RegisterCodeReturnModel({this.success, this.data, this.error});

  RegisterCodeReturnModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    data = json['data'] != null
        ? RegisterCodeReturnDataModel.fromJson(json['data'])
        : null;
    error = json['error'] != null ? ErrorModel.fromJson(json['error']) : null;
  }
  RegisterCodeReturnModel.fromJsonRegister(Map<String, dynamic> json) {
    success = json['success'];
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

class RegisterCodeReturnDataModel {
  String? email;

  RegisterCodeReturnDataModel({this.email});

  RegisterCodeReturnDataModel.fromJson(Map<String, dynamic> json) {
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['email'] = email;
    return data;
  }
}
