import 'package:technicmate/common/models/models.dart';

class UserProfileModel {
  bool? succes;
  UserProfileDataModel? data;
  ErrorModel? error;

  UserProfileModel({this.succes, this.data, this.error});

  UserProfileModel.fromJson(Map<String, dynamic> json) {
    succes = json['succes'];
    data = json['data'] != null
        ? UserProfileDataModel.fromJson(json['data'])
        : null;
    error = json['error'] != null ? ErrorModel.fromJson(json['error']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['succes'] = succes;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    if (error != null) {
      data['error'] = error!.toJson();
    }
    return data;
  }
}

class UserProfileDataModel {
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
  UniversityModel? university;
  DepartmentModel? department;

  UserProfileDataModel(
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

  UserProfileDataModel.fromJson(Map<String, dynamic> json) {
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
    university = json['university'] != null
        ? UniversityModel.fromJson(json['university'])
        : null;
    department = json['department'] != null
        ? DepartmentModel.fromJson(json['department'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['user_id'] = userId;
    data['profile_image_data'] = profileImageData;
    data['email'] = email;
    data['firstname'] = firstname;
    data['lastname'] = lastname;
    data['follower_count'] = followerCount;
    data['followed_by_count'] = followedByCount;
    data['note_count'] = noteCount;
    data['biography'] = biography;
    data['is_follow'] = isFollow;
    data['is_follower'] = isFollower;
    if (university != null) {
      data['university'] = university!.toJson();
    }
    if (department != null) {
      data['department'] = department!.toJson();
    }
    return data;
  }
}
