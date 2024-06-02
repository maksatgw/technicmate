import 'dart:io';

import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';
import 'package:technicmate/core/service/dio_service.dart';
import 'package:technicmate/features/feed/model/feed_model.dart';
import 'package:technicmate/features/post/model/comment_create_model.dart';
import 'package:technicmate/features/post/model/post_create_model.dart';
import 'package:technicmate/features/post/model/post_create_response_model.dart';
import 'package:technicmate/features/post/model/post_get_by_id_model.dart';

class PostService {
  final Dio dio = DioService.baseDio();
  final box = GetStorage();

  Future<PostGetByIdModel?> getPostById(String postId) async {
    try {
      final response = await dio.get(
        "/posts/$postId",
        options: Options(
          headers: {
            "authorization": "Bearer ${box.read("bearer")}",
          },
        ),
      );
      if (response.statusCode == 200) {
        print(response.data);
        return PostGetByIdModel.fromJson(response.data);
      }
    } on DioException catch (e) {
      print(e);
    }
    return null;
  }

  Future<FeedModel?> getPostComments(String postId) async {
    try {
      final response = await dio.get(
        "/posts/$postId/comments",
        options: Options(
          headers: {
            "authorization": "Bearer ${box.read("bearer")}",
          },
        ),
      );
      if (response.statusCode == 200) {
        return FeedModel.fromJson(response.data);
      }
    } on DioException catch (e) {
      print(e);
    }
    return null;
  }

  Future<bool> likePost(String postId) async {
    try {
      final response = await dio.get(
        "/posts/$postId/likes/push",
        options: Options(
          headers: {
            "authorization": "Bearer ${box.read("bearer")}",
          },
        ),
      );
      if (response.statusCode == HttpStatus.ok) {
        response.data;
        return true;
      }
    } on DioException catch (e) {
      print(e);
    }
    return false;
  }

  Future<PostCreateResponseModel?> createPost(PostCreateModel model) async {
    try {
      final response = await dio.post(
        "/posts",
        data: model.toJson(),
        options: Options(
          headers: {
            "authorization": "Bearer ${box.read("bearer")}",
          },
        ),
      );
      if (response.statusCode == 200) {
        return PostCreateResponseModel.fromJson(response.data);
      }
    } on DioException catch (e) {
      print(e);
    }
    return null;
  }

  Future<bool> createComment(CommentCreateModel model) async {
    try {
      final response = await dio.post(
        "/posts",
        data: model.toJson(),
        options: Options(
          headers: {
            "authorization": "Bearer ${box.read("bearer")}",
          },
        ),
      );
      if (response.statusCode == 200) {
        return true;
      }
      return false;
    } on DioException catch (e) {
      print(e);
    }
    return false;
  }
}
