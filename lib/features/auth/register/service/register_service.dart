import 'package:dio/dio.dart';
import 'package:technicmate/core/service/dio_service.dart';
import 'package:technicmate/features/auth/register/model/register_code_model.dart';
import 'package:technicmate/features/auth/register/model/register_departments_model.dart';

class RegisterService {
  final Dio dio = DioService.baseDio();

  Future<RegisterDepartmentModel?> getDepartments(String? uniId) async {
    try {
      final response = await dio.get("/universities/$uniId/departments");
      if (response.statusCode == 200) {
        print(response.data);
        return RegisterDepartmentModel.fromJson(response.data);
      }
      return null;
    } on DioException catch (e) {
      print(e);
    }
  }

  Future<RegisterCodeReturnModel?> registerPostModel(RegisterModel req) async {
    try {
      final response = await dio.post('/auth/register/', data: req.toJson());
      if (response.statusCode == 200) {
        print(response.data);
        return RegisterCodeReturnModel.fromJsonRegister(response.data);
      }
    } on DioException catch (e) {
      print(e);
    }
  }

  Future<RegisterCodeReturnModel?> registerCodePost(RegisterCodeModel req) async {
    try {
      final response = await dio.post('/auth/register/code', data: req.toJson());
      if (response.statusCode == 200) {
        print(response.data);
        return RegisterCodeReturnModel.fromJson(response.data);
      }
    } on DioException catch (e) {
      print(e);
    }
  }
}
