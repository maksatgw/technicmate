import 'package:technicmate/features/auth/model/department_model.dart';
import 'package:technicmate/features/auth/model/error_model.dart';
import 'package:technicmate/features/auth/model/user_model.dart';
import 'package:technicmate/features/feed/model/additionals_model.dart';

class FeedModel {
  bool? success;
  List<Data>? data;
  Error? error;

  FeedModel({this.success, this.data, this.error});

  FeedModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
    error = json['error'] != null ? new Error.fromJson(json['error']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
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
  String? text;
  int? postTypeId;
  int? postStatusId;
  List<Additionals>? additionals;
  Department? department;
  User? user;
  String? createdAt;

  Data({this.text, this.postTypeId, this.postStatusId, this.additionals, this.department, this.user, this.createdAt});

  Data.fromJson(Map<String, dynamic> json) {
    text = json['text'];
    postTypeId = json['post_type_id'];
    postStatusId = json['post_status_id'];
    if (json['additionals'] != null) {
      additionals = <Additionals>[];
      json['additionals'].forEach((v) {
        additionals!.add(new Additionals.fromJson(v));
      });
    }
    department = json['department'] != null ? new Department.fromJson(json['department']) : null;
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['text'] = this.text;
    data['post_type_id'] = this.postTypeId;
    data['post_status_id'] = this.postStatusId;
    if (this.additionals != null) {
      data['additionals'] = this.additionals!.map((v) => v.toJson()).toList();
    }
    if (this.department != null) {
      data['department'] = this.department!.toJson();
    }
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    data['created_at'] = this.createdAt;
    return data;
  }
}
