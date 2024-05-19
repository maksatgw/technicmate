import 'package:get/get.dart';
import 'package:technicmate/features/auth/login/view/login_view.dart';

//SplashController adında sınıfımız getxcontroller adındaki bir abstract classtan miras alır.
class SplashController extends GetxController {
  //Bu controller başladığında
  @override
  void onInit() {
    //5 saniye gecikmeli bir işlem yaparak Logine yönlendirme yapıyoruz.
    Future.delayed(const Duration(seconds: 5), () {
      Get.off(() => LoginView());
    });
    super.onInit();
  }
}
