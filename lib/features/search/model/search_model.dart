import 'package:technicmate/common/models/models.dart';
import 'package:technicmate/features/search/model/search_response_model.dart';

class UserSearchModel {
  bool? success;
  List<UserSearchResponseModel>? data;
  ErrorModel? error;

  UserSearchModel({this.success, this.data, this.error});

  UserSearchModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['data'] != null) {
      data = <UserSearchResponseModel>[];
      json['data'].forEach((v) {
        data!.add(UserSearchResponseModel.fromJson(v));
      });
    }
    error = json['error'] != null ? ErrorModel.fromJson(json['error']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    if (error != null) {
      data['error'] = error!.toJson();
    }
    return data;
  }
}
