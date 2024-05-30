import 'package:technicmate/common/models/models.dart';

class UserSearchResponseModel {
  String? userId;
  String? profileImageData;
  String? email;
  String? firstname;
  String? lastname;
  bool? isFollow;
  bool? isFollower;
  UniversityModel? university;
  DepartmentModel? department;

  UserSearchResponseModel(
      {this.userId,
      this.profileImageData,
      this.email,
      this.firstname,
      this.lastname,
      this.isFollow,
      this.isFollower,
      this.university,
      this.department});

  UserSearchResponseModel.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    profileImageData = json['profile_image_data'];
    email = json['email'];
    firstname = json['firstname'];
    lastname = json['lastname'];
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
