import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';
import 'package:technicmate/core/service/dio_service.dart';
import 'package:technicmate/features/search/model/search_model.dart';

class SearchService {
  final Dio dio = DioService.baseDio();
  final box = GetStorage();

  Future<UserSearchModel?> searchUser(String? query) async {
    try {
      final response = await dio.get(
        "/users",
        queryParameters: {
          's': query,
        },
        options: Options(
          headers: {"authorization": "Bearer ${box.read("bearer")}"},
        ),
      );
      if (response.statusCode == 200) {
        return UserSearchModel.fromJson(response.data);
      }
    } on DioException catch (e) {
      print(e);
    }
    return null;
  }
}
