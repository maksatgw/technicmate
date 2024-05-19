import 'package:technicmate/features/auth/model/department_model.dart';
import 'package:technicmate/features/auth/model/university_model.dart';

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

  User({this.userId, this.profileImageData, this.email, this.firstname, this.lastname, this.followerCount, this.followedByCount, this.biography, this.university, this.department});

  User.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    profileImageData = json['profile_image_data'];
    email = json['email'];
    firstname = json['firstname'];
    lastname = json['lastname'];
    followerCount = json['follower_count'];
    followedByCount = json['followed_by_count'];
    biography = json['biography'];
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
    data['biography'] = this.biography;
    if (this.university != null) {
      data['university'] = this.university!.toJson();
    }
    if (this.department != null) {
      data['department'] = this.department!.toJson();
    }
    return data;
  }
}
