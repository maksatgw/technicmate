import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:technicmate/features/feed/controller/feed_controller.dart';
import 'package:technicmate/features/home/controller/home_controller.dart';
import 'package:technicmate/features/post/model/post_create_model.dart';
import 'package:technicmate/features/post/service/post_add_service.dart';

class PostAddController extends GetxController {
  RxBool isSelected = false.obs;
  final RxInt selectedValue = 1.obs;
  TextEditingController postBodyController = TextEditingController();
  final PostAddService service = PostAddService();
  PostCreateModel req = PostCreateModel();
  var isLoading = false.obs;

  Future<void> postData() async {
    try {
      req.postTypeId = selectedValue.value ?? 3;
      req.text = postBodyController.text;
      isLoading.value = true;
      var response = await service.postData(req);
      if (response?.success == true) {
        var homeController = Get.put(HomeController());
        var feedController = Get.put(FeedController());
        Get.snackbar(
          "Başarılı",
          "Postunuz kaydedildi.",
          snackPosition: SnackPosition.TOP,
          colorText: Colors.white,
          backgroundColor: Colors.blue,
          icon: const Icon(Icons.add_alert),
        );
        await feedController.fetchPosts();
        homeController.changePage(0);
        isLoading.value = false;
      } else {
        isLoading.value = false;
        Get.snackbar(
          "Hata",
          "Post kaydedilemedi. Lütfen tekrar deneyin.",
          snackPosition: SnackPosition.BOTTOM,
          colorText: Colors.white,
          backgroundColor: Colors.red,
          icon: const Icon(Icons.error),
        );
        var homeController = Get.put(HomeController());
        var feedController = Get.put(FeedController());

        await feedController.fetchPosts();
        homeController.changePage(0);
      }
    } catch (e) {
      print(e);
    }
  }
}
