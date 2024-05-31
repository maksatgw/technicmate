import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';
import 'package:technicmate/core/service/dio_service.dart';

class CommentService {
  final Dio dio = DioService.baseDio();
  final box = GetStorage();
}
