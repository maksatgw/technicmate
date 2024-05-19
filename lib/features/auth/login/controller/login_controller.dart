import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:technicmate/features/auth/login/view/login_password_view.dart';
import 'package:technicmate/features/auth/login/model/user_request_model.dart';
import 'package:technicmate/features/auth/service/login_service.dart';
import 'package:technicmate/features/feed/view/feed_view.dart';

class LoginController extends GetxController {
  //UI Tarafında TextFormField'larımızın controller nesnelerini tanımlıyoruz.
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  //isteklerimizi atacağımız servisleri tanımlıyoruz.
  LoginService service = LoginService();
  //Servisteki metodlarımızda kullanılacak olan modelimiz.
  UserRequestModel req = UserRequestModel();
  //Local storage için kullanacağımız kütüphane nesnesi.
  final box = GetStorage();

  //Void tipinde asenkron bir metot.
  //Diğer featurelar eklendiğinde değişiklikler yapılacak.
  Future<void> checkEmail() async {
    req.email = emailController.text;
    var response = await service.checkEmail(req);
    if (response?.success == true) {
      if (response?.data?.isLogin == true) {
        Get.to(() => LoginPasswordView());
      }
    } else {
      Get.snackbar(
        "Hata",
        "Bu mail ile sisteme kayıt olamazsınız.",
        snackPosition: SnackPosition.BOTTOM,
        colorText: Colors.white,
        backgroundColor: Colors.red,
        icon: const Icon(Icons.add_alert),
      );
    }
  }

  Future<void> postUser() async {
    req.email = emailController.text;
    req.password = passwordController.text;
    var response = await service.postUser(req);
    if (response?.success == true) {
      box.write("bearer", response?.data?.token);
      Get.snackbar(
        "Başarılı",
        "${box.read("bearer")}",
        snackPosition: SnackPosition.BOTTOM,
        colorText: Colors.white,
        backgroundColor: Colors.blue,
        icon: const Icon(Icons.add_alert),
      );
      Get.to(() => FeedView());
    }
  }
}
