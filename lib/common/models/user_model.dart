import 'package:technicmate/common/models/department_model.dart';
import 'package:technicmate/common/models/university_model.dart';

class User {
  String? userId;
  String? profileImageData;
  String? email;
  String? firstname;
  String? lastname;
  String? followerCount;
  String? followedByCount;
  String? biography;
  University? university;
  Department? department;

  User(
      {this.userId,
      this.profileImageData,
      this.email,
      this.firstname,
      this.lastname,
      this.followerCount,
      this.followedByCount,
      this.biography,
      this.university,
      this.department});

  User.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    profileImageData = json['profile_image_data'];
    email = json['email'];
    firstname = json['firstname'];
    lastname = json['lastname'];
    followerCount = json['follower_count'];
    followedByCount = json['followed_by_count'];
    biography = json['biography'];
    university = json['university'] != null
        ? University.fromJson(json['university'])
        : null;
    department = json['department'] != null
        ? Department.fromJson(json['department'])
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
