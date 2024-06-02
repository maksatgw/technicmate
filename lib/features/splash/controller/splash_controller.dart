import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:technicmate/features/auth/login/view/login_view.dart';
import 'package:technicmate/features/home/view/home_view.dart';

//SplashController adında sınıfımız getxcontroller adındaki bir abstract classtan miras alır.
class SplashController extends GetxController {
  final box = GetStorage();
  //Bu controller başladığında
  @override
  void onInit() {
    //5 saniye gecikmeli bir işlem yaparak Logine yönlendirme yapıyoruz.
    Future.delayed(const Duration(seconds: 2), () {
      if (box.read('bearer') == null) {
        Get.off(() => LoginView());
      } else {
        Get.off(() => HomeView());
      }
    });
    super.onInit();
  }
}
