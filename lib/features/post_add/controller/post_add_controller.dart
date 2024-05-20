import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:technicmate/features/home/controller/home_controller.dart';
import 'package:technicmate/features/home/view/home_view.dart';
import 'package:technicmate/features/post_add/model/post_create_model.dart';
import 'package:technicmate/features/post_add/service/post_add_service.dart';

class PostAddController extends GetxController {
  RxBool isSelected = false.obs;
  final RxInt selectedValue = 1.obs;
  TextEditingController postBodyController = TextEditingController();
  final PostAddService service = PostAddService();
  PostCreateModel req = PostCreateModel();
  var isLoading = false.obs;

  Future<void> postData() async {
    try {
      req.postTypeId = selectedValue.value ?? 1;
      req.text = postBodyController.text;
      isLoading.value = true;
      var response = await service.postData(req);
      if (response?.success == true) {
        isLoading.value = false;
        Get.snackbar(
          "Başarılı",
          "Postunuz kaydedildi.",
          snackPosition: SnackPosition.TOP,
          colorText: Colors.white,
          backgroundColor: Colors.blue,
          icon: const Icon(Icons.add_alert),
        );

        // Get instance of HomeController
        HomeController homeController = Get.find<HomeController>();
        // Change the current index to the desired page (e.g., 0 for FeedView)
        homeController.changePage(0);
      }
    } catch (e) {
      // Handle the error
      isLoading.value = false;
      Get.snackbar(
        "Hata",
        "Post kaydedilemedi. Lütfen tekrar deneyin.",
        snackPosition: SnackPosition.BOTTOM,
        colorText: Colors.white,
        backgroundColor: Colors.red,
        icon: const Icon(Icons.error),
      );
    }
  }
}
