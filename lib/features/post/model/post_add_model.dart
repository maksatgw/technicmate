class PostAddModel {
  bool? success;
  Data? data;
  Error? error;

  PostAddModel({this.success, this.data, this.error});

  PostAddModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    error = json['error'] != null ? new Error.fromJson(json['error']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
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
  String? postId;
  String? postOwnerUserId;
  int? postTypeId;
  int? postStatusId;
  String? updatedAt;
  String? createdAt;
  Details? details;

  Data({this.postId, this.postOwnerUserId, this.postTypeId, this.postStatusId, this.updatedAt, this.createdAt, this.details});

  Data.fromJson(Map<String, dynamic> json) {
    postId = json['post_id'];
    postOwnerUserId = json['post_owner_user_id'];
    postTypeId = json['post_type_id'];
    postStatusId = json['post_status_id'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    details = json['details'] != null ? new Details.fromJson(json['details']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['post_id'] = this.postId;
    data['post_owner_user_id'] = this.postOwnerUserId;
    data['post_type_id'] = this.postTypeId;
    data['post_status_id'] = this.postStatusId;
    data['updated_at'] = this.updatedAt;
    data['created_at'] = this.createdAt;
    if (this.details != null) {
      data['details'] = this.details!.toJson();
    }
    return data;
  }
}

class Details {
  String? postId;
  String? text;
  int? likeCount;

  Details({this.postId, this.text, this.likeCount});

  Details.fromJson(Map<String, dynamic> json) {
    postId = json['post_id'];
    text = json['text'];
    likeCount = json['like_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['post_id'] = this.postId;
    data['text'] = this.text;
    data['like_count'] = this.likeCount;
    return data;
  }
}

class Error {
  String? code;
  String? message;

  Error({this.code, this.message});

  Error.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['message'] = this.message;
    return data;
  }
}
