import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';
import 'package:technicmate/core/service/dio_service.dart';
import 'package:technicmate/features/feed/model/feed_model.dart';
import 'package:technicmate/features/user/model/user_profile_model.dart';

class UserProfileService {
  final Dio dio = DioService.baseDio();
  final box = GetStorage();

  Future<UserProfileModel?> getUserProfile(String userId) async {
    try {
      final response = await dio.get(
        "/users/$userId",
        options: Options(
          headers: {"authorization": "Bearer ${box.read("bearer")}"},
        ),
      );
      if (response.statusCode == 200) {
        print(response.data);
        // var values = UserProfileModel.fromJson(response.data);
        return UserProfileModel.fromJson(response.data);
      }
    } on DioException catch (e) {
      print(e);
    }
  }

  Future<FeedModel?> getPostsByUserId(String userId) async {
    try {
      final response = await dio.get(
        "/posts",
        queryParameters: {
          'user_id': userId,
        },
        options: Options(
          headers: {"authorization": "Bearer ${box.read("bearer")}"},
        ),
      );
      if (response.statusCode == 200) {
        var values = FeedModel.fromJson(response.data);
        return values;
      }
    } on DioException catch (e) {
      print(e);
    }
  }
}
