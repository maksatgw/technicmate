import 'package:technicmate/common/models/department_model.dart';
import 'package:technicmate/common/models/user_model.dart';
import 'package:technicmate/common/models/additionals_model.dart';

class PostModel {
  String? text;
  int? postTypeId;
  String? postId;
  int? postStatusId;
  List<Additionals>? additionals;
  DepartmentModel? department;
  UserModel? user;
  String? createdAt;
  bool? isLiked;
  int? likeCount;

  PostModel(
      {this.text,
      this.postTypeId,
      this.postStatusId,
      this.additionals,
      this.department,
      this.user,
      this.isLiked,
      this.createdAt,
      this.likeCount,
      this.postId});

  PostModel.fromJson(Map<String, dynamic> json) {
    text = json['text'];
    postId = json['post_id'];
    likeCount = json['like_count'];
    isLiked = json['is_liked'];
    postTypeId = json['post_type_id'];
    postStatusId = json['post_status_id'];
    if (json['additionals'] != null) {
      additionals = <Additionals>[];
      json['additionals'].forEach((v) {
        additionals!.add(Additionals.fromJson(v));
      });
    }
    department = json['department'] != null
        ? DepartmentModel.fromJson(json['department'])
        : null;
    user = json['user'] != null ? UserModel.fromJson(json['user']) : null;
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['text'] = text;
    data['post_type_id'] = postTypeId;
    data['post_status_id'] = postStatusId;
    if (additionals != null) {
      data['additionals'] = additionals!.map((v) => v.toJson()).toList();
    }
    if (department != null) {
      data['department'] = department!.toJson();
    }
    if (user != null) {
      data['user'] = user!.toJson();
    }
    data['created_at'] = createdAt;
    return data;
  }
}
