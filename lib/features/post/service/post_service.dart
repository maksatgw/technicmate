import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';
import 'package:technicmate/core/service/dio_service.dart';
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
}
