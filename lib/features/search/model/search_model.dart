import 'package:technicmate/features/auth/model/department_model.dart';
import 'package:technicmate/features/auth/model/error_model.dart';
import 'package:technicmate/features/auth/model/university_model.dart';

class UserSearchModel {
  bool? success;
  List<Data>? data;
  Error? error;

  UserSearchModel({this.success, this.data, this.error});

  UserSearchModel.fromJson(Map<String, dynamic> json) {
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
  String? userId;
  String? profileImageData;
  String? email;
  String? firstname;
  String? lastname;
  bool? isFollow;
  bool? isFollower;
  University? university;
  Department? department;

  Data({this.userId, this.profileImageData, this.email, this.firstname, this.lastname, this.isFollow, this.isFollower, this.university, this.department});

  Data.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    profileImageData = json['profile_image_data'];
    email = json['email'];
    firstname = json['firstname'];
    lastname = json['lastname'];
    isFollow = json['is_follow'];
    isFollower = json['is_follower'];
    university = json['university'] != null ? new University.fromJson(json['university']) : null;
    department = json['department'] != null ? new Department.fromJson(json['department']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['profile_image_data'] = this.profileImageData;
    data['email'] = this.email;
    data['firstname'] = this.firstname;
    data['lastname'] = this.lastname;
    data['is_follow'] = this.isFollow;
    data['is_follower'] = this.isFollower;
    if (this.university != null) {
      data['university'] = this.university!.toJson();
    }
    if (this.department != null) {
      data['department'] = this.department!.toJson();
    }
    return data;
  }
}
