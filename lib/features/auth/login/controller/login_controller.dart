import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:technicmate/constants/asset_constants.dart';
import 'package:technicmate/features/auth/login/model/check_email_model.dart';
import 'package:technicmate/features/auth/login/view/login_password_view.dart';
import 'package:technicmate/features/auth/login/model/user_request_model.dart';
import 'package:technicmate/features/auth/login/service/login_service.dart';
import 'package:technicmate/features/auth/register/controller/register_controller.dart';
import 'package:technicmate/features/auth/register/view/register_name_view.dart';
import 'package:technicmate/features/home/view/home_view.dart';

class LoginController extends GetxController {
  //UI Tarafında TextFormField'larımızın controller nesnelerini tanımlıyoruz.
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  //Servisteki metodlarımızda kullanılacak olan modeller.
  UserRequestModel userRequsetModel = UserRequestModel();
  CheckEmailModel checkEmailModel = CheckEmailModel();
  //isteklerimizi atacağımız servisleri tanımlıyoruz.
  LoginService service = LoginService();
  //Local storage için kullanacağımız kütüphane nesnesi.
  final box = GetStorage();

  //Yükleme esnasında olduğumuzu kullanıcıya belirtmemize yarayan boolean değeri.
  var isLoading = false.obs;

  //Void tipinde asenkron bir metot.
  Future<void> checkEmail() async {
    //isLoading de
    userRequsetModel.email = emailController.text;
    var response = await service.checkEmail(userRequsetModel);
    if (response?.success == true) {
      if (response?.data?.isLogin == true && response != null) {
        isLoading.value = false;
        Get.to(() => LoginPasswordView(model: response));
      } else if (response?.data?.isRegister == true) {
        Get.snackbar(
          "Bilgilendirme",
          "Sistemde kaydınız bulunmamaktadır. Bir hesap oluşturabilirsiniz.",
          snackPosition: SnackPosition.BOTTOM,
          colorText: Colors.white,
          backgroundColor: Colors.blue,
          icon: const Icon(Icons.add_alert),
        );
        RegisterController registerController = Get.put(RegisterController());
        registerController.universityId =
            response?.data?.university?.universityId;
        registerController.email = response?.data?.email;
        isLoading.value = false;
        Get.to(() => RegisterNameView());
      }
    } else {
      isLoading.value = true;
      Get.snackbar(
        "Hata",
        "Bu mail ile sisteme kayıt olamazsınız.",
        snackPosition: SnackPosition.BOTTOM,
        colorText: Colors.white,
        backgroundColor: Colors.red,
        icon: const Icon(Icons.add_alert),
      );
      isLoading.value = false;
    }
  }

  Future<void> checkUser() async {
    isLoading.value = true;
    userRequsetModel.email = emailController.text;
    userRequsetModel.password = passwordController.text;
    var response = await service.postUser(userRequsetModel);
    if (response?.success == false) {
      isLoading.value = false;
      Get.snackbar(
        "Hata",
        response?.error?.message ?? "Bir hata oluştu.",
        snackPosition: SnackPosition.BOTTOM,
        colorText: Colors.white,
        backgroundColor: Colors.red,
        icon: const Icon(Icons.add_alert),
      );
    } else {
      box.write("bearer", response?.data?.token);
      box.write("uid", response?.data?.userId);
      box.write(
        "uimage",
        response?.data?.user?.profileImageData ??
            AssetConstants.defaultProfileImage,
      );
      Get.snackbar(
        "Başarılı",
        "Hoş geldiniz",
        snackPosition: SnackPosition.BOTTOM,
        colorText: Colors.white,
        backgroundColor: Colors.blue,
        icon: const Icon(Icons.add_alert),
      );
      Get.offAll(() => HomeView());
    }
  }
}
