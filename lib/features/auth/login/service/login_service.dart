import 'package:dio/dio.dart';
import 'package:technicmate/core/service/dio_service.dart';
import 'package:technicmate/features/auth/login/model/check_email_model.dart';
import 'package:technicmate/features/auth/login/model/login_model.dart';
import 'package:technicmate/features/auth/login/model/user_request_model.dart';

class LoginService {
  //Core dizinin altında tanımlanmış olan statik baseDio metodumuzu getiriyoruz.
  final Dio dio = DioService.baseDio();

  //postUser Future tipinde geriye LoginModel dönen asenkron bir metot
  //UserRequestModel tipinde parametre alıyor.
  Future<CheckEmailModel?> checkEmail(UserRequestModel req) async {
    //Hata ayıklaması yapabilmek adına try catch bloğu kullanıyoruz.
    try {
      //response'umuz dio kütüphanesinin post özelliği ile geliyor.
      //istek yapacağımız endpoint ve göndereceğimiz datayı json'a dönüştürerek veriyoruz.
      final response =
          await dio.post('/auth/check-email', data: req.toCheckEmailJson());
      //response'tan gelen status code'u alıyoruz.
      if (response.statusCode == 200) {
        //Her şey yolunda gittiği takdirde
        //CheckEmailModel fromJson metoduna mapleyerek return ediyoruz.
        return CheckEmailModel.fromJson(response.data);
      }
      return null;
    } on DioException catch (e) {
      print(e);
    }
    return null;
  }

  //postUser Future tipinde geriye LoginModel dönen asenkron bir metot
  //UserRequestModel tipinde parametre alıyor.
  Future<LoginModel?> postUser(UserRequestModel req) async {
    //Hata ayıklaması yapabilmek adına try catch bloğu kullanıyoruz.
    try {
      //response'umuz dio kütüphanesinin post özelliği ile geliyor.
      //istek yapacağımız endpoint ve göndereceğimiz datayı json'a dönüştürerek veriyoruz.
      final response = await dio.post('/auth/login', data: req.toJson());
      //response'tan gelen status code'u alıyoruz.
      if (response.statusCode == 200) {
        //Her şey yolunda gittiği takdirde
        //LoginModelimizdeki fromJson metoduna mapleyerek return ediyoruz.
        return LoginModel.fromJson(response.data);
      }
      return null;
    } on DioException catch (e) {
      print(e);
    }
    return null;
  }
}
