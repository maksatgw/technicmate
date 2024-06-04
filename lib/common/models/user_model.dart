import 'package:technicmate/common/models/models.dart';

class UserModel {
  String? userId;
  String? profileImageData;
  String? email;
  String? firstname;
  String? lastname;
  String? followerCount;
  String? followedByCount;
  String? biography;
  bool? isFollowing;
  bool? isFollowed;

  UniversityModel? university;
  DepartmentModel? department;

  UserModel(
      {this.userId,
      this.profileImageData,
      this.email,
      this.firstname,
      this.lastname,
      this.isFollowed,
      this.isFollowing,
      this.followerCount,
      this.followedByCount,
      this.biography,
      this.university,
      this.department});

  UserModel.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    profileImageData = json['profile_image_data'];
    isFollowing = json["is_follow"];
    isFollowed = json['is_follower'];
    email = json['email'];
    firstname = json['firstname'];
    lastname = json['lastname'];
    followerCount = json['follower_count'];
    followedByCount = json['followed_by_count'];
    biography = json['biography'];
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
    data['biography'] = biography;
    if (university != null) {
      data['university'] = university!.toJson();
    }
    if (department != null) {
      data['department'] = department!.toJson();
    }
    return data;
  }
}
