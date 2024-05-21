import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';
import 'package:technicmate/core/service/dio_service.dart';
import 'package:technicmate/features/feed/model/feed_model.dart';

class FeedService {
  final Dio dio = DioService.baseDio();
  final box = GetStorage();
  Future<FeedModel?> getPosts() async {
    try {
      final response = await dio.get("/posts", options: Options(headers: {"authorization": "Bearer ${box.read("bearer")}"}));
      if (response.statusCode == 200) {
        var values = FeedModel.fromJson(response.data);
        print(response.data);
        return values;
      }
    } on DioException catch (e) {
      print(e);
    }
  }

  Future<FeedModel?> getAnnouncements() async {
    try {
      final response = await dio.get(
        "/posts",
        options: Options(
          headers: {"authorization": "Bearer ${box.read("bearer")}"},
        ),
        queryParameters: {'post_type_id': 4},
      );
      if (response.statusCode == 200) {
        var values = FeedModel.fromJson(response.data);
        print(response.data);
        return values;
      }
    } on DioException catch (e) {
      print(e);
    }
  }
}
