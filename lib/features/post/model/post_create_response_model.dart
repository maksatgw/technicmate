import 'package:technicmate/common/models/models.dart';

class PostCreateResponseModel {
  bool? success;
  PostCreateResponseDataModel? data;
  ErrorModel? error;

  PostCreateResponseModel({this.success, this.data, this.error});

  PostCreateResponseModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    data = json['data'] != null
        ? PostCreateResponseDataModel.fromJson(json['data'])
        : null;
    error = json['error'] != null ? ErrorModel.fromJson(json['error']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    if (error != null) {
      data['error'] = error!.toJson();
    }
    return data;
  }
}

class PostCreateResponseDataModel {
  String? postId;
  String? postOwnerUserId;
  int? postTypeId;
  int? postStatusId;
  String? updatedAt;
  String? createdAt;
  PostCreateResponseDataDetailModel? details;

  PostCreateResponseDataModel(
      {this.postId,
      this.postOwnerUserId,
      this.postTypeId,
      this.postStatusId,
      this.updatedAt,
      this.createdAt,
      this.details});

  PostCreateResponseDataModel.fromJson(Map<String, dynamic> json) {
    postId = json['post_id'];
    postOwnerUserId = json['post_owner_user_id'];
    postTypeId = json['post_type_id'];
    postStatusId = json['post_status_id'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    details = json['details'] != null
        ? PostCreateResponseDataDetailModel.fromJson(json['details'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['post_id'] = postId;
    data['post_owner_user_id'] = postOwnerUserId;
    data['post_type_id'] = postTypeId;
    data['post_status_id'] = postStatusId;
    data['updated_at'] = updatedAt;
    data['created_at'] = createdAt;
    if (details != null) {
      data['details'] = details!.toJson();
    }
    return data;
  }
}

class PostCreateResponseDataDetailModel {
  String? postId;
  String? text;
  int? likeCount;

  PostCreateResponseDataDetailModel({this.postId, this.text, this.likeCount});

  PostCreateResponseDataDetailModel.fromJson(Map<String, dynamic> json) {
    postId = json['post_id'];
    text = json['text'];
    likeCount = json['like_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['post_id'] = postId;
    data['text'] = text;
    data['like_count'] = likeCount;
    return data;
  }
}
