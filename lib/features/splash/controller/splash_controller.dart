import 'package:get/get.dart';

//SplashController adında sınıfımız getxcontroller adındaki bir abstract classtan miras alır.
class SplashController extends GetxController {
  //Bu controller başladığında
  @override
  void onInit() {
    //5 saniye gecikmeli bir işlem yaparak Logine yönlendirme yapıyoruz.
    Future.delayed(const Duration(seconds: 5), () {
      //Login Feature eklendiğinde bu satır değişecek.
      Get.off("Login");
    });
    super.onInit();
  }
}
