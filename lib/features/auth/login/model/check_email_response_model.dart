import 'package:technicmate/common/models/models.dart';

class CheckEmailResponseDataModel {
  bool? isLogin;
  bool? isRegister;
  String? email;
  String? rootMail;
  String? studentMail;
  UniversityModel? university;
  String? profileImage;
  CheckEmailResponseDataModel(
      {this.isLogin,
      this.isRegister,
      this.email,
      this.rootMail,
      this.studentMail,
      this.university,
      this.profileImage});

  CheckEmailResponseDataModel.fromJson(Map<String, dynamic> json) {
    isLogin = json['is_login'];
    isRegister = json['is_register'];
    email = json['email'];
    rootMail = json['root_mail'];
    studentMail = json['student_mail'];
    profileImage = json['profile_image_data'];
    university = json['university'] != null
        ? UniversityModel.fromJson(json['university'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['is_login'] = isLogin;
    data['is_register'] = isRegister;
    data['email'] = email;
    data['root_mail'] = rootMail;
    data['student_mail'] = studentMail;
    if (university != null) {
      data['university'] = university!.toJson();
    }
    return data;
  }
}
