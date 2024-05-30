import 'package:technicmate/common/models/models.dart';

class FeedModel {
  bool? success;
  List<PostModel>? data;
  ErrorModel? error;

  FeedModel({this.success, this.data, this.error});

  FeedModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['data'] != null) {
      data = <PostModel>[];
      json['data'].forEach((v) {
        data!.add(PostModel.fromJson(v));
      });
    }
    error = json['error'] != null ? ErrorModel.fromJson(json['error']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    if (error != null) {
      data['error'] = error!.toJson();
    }
    return data;
  }
}
