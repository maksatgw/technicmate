import 'dart:ffi';

import 'package:technicmate/features/auth/model/department_model.dart';
import 'package:technicmate/features/auth/model/error_model.dart';
import 'package:technicmate/features/auth/model/university_model.dart';

class UserProfileModel {
  bool? succes;
  Data? data;
  Error? error;

  UserProfileModel({this.succes, this.data, this.error});

  UserProfileModel.fromJson(Map<String, dynamic> json) {
    succes = json['succes'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    error = json['error'] != null ? new Error.fromJson(json['error']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['succes'] = this.succes;
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
  String? userId;
  String? profileImageData;
  String? email;
  String? firstname;
  String? lastname;
  int? followerCount;
  int? followedByCount;
  int? noteCount;
  String? biography;
  bool? isFollow;
  bool? isFollower;
  University? university;
  Department? department;

  Data(
      {this.userId,
      this.profileImageData,
      this.email,
      this.firstname,
      this.lastname,
      this.followerCount,
      this.followedByCount,
      this.noteCount,
      this.biography,
      this.isFollow,
      this.isFollower,
      this.university,
      this.department});

  Data.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    profileImageData = json['profile_image_data'];
    email = json['email'];
    firstname = json['firstname'];
    lastname = json['lastname'];
    followerCount = json['follower_count'];
    followedByCount = json['followed_by_count'];
    noteCount = json['note_count'];
    biography = json['biography'];
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
    data['follower_count'] = this.followerCount;
    data['followed_by_count'] = this.followedByCount;
    data['note_count'] = this.noteCount;
    data['biography'] = this.biography;
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
