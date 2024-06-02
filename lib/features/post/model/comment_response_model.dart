import 'package:technicmate/common/models/error_model.dart';

class CommentResponseModel {
  bool? success;
  List<CommentResponseModel>? data;
  ErrorModel? error;

  CommentResponseModel({this.success, this.data, this.error});

  CommentResponseModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['data'] != null) {
      data = <CommentResponseModel>[];
      json['data'].forEach((v) {
        data!.add(CommentResponseModel.fromJson(v));
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
