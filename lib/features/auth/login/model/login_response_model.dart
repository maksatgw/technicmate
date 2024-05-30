import 'package:technicmate/common/models/models.dart';

class LoginDataResponeModel {
  String? token;
  String? userTypeId;
  String? userId;
  UserModel? user;
  String? validityAt;
  String? createdAt;

  LoginDataResponeModel(
      {this.token,
      this.userTypeId,
      this.userId,
      this.user,
      this.validityAt,
      this.createdAt});

  LoginDataResponeModel.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    userTypeId = json['user_type_id'];
    userId = json['user_id'];
    user = json['user'] != null ? UserModel.fromJson(json['user']) : null;
    validityAt = json['validity_at'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['token'] = token;
    data['user_type_id'] = userTypeId;
    data['user_id'] = userId;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    data['validity_at'] = validityAt;
    data['created_at'] = createdAt;
    return data;
  }
}
