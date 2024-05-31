import 'package:technicmate/common/models/models.dart';

class PostGetByIdModel {
  bool? success;
  PostModel? data;
  ErrorModel? error;

  PostGetByIdModel({this.success, this.data, this.error});

  PostGetByIdModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    data = json['data'] != null ? PostModel.fromJson(json['data']) : null;
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
