import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:technicmate/features/feed/model/feed_model.dart';
import 'package:technicmate/features/feed/service/feed_service.dart';

class FeedController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late TabController tabController;
  final FeedService service = FeedService();
  final box = GetStorage();
  var isLoading = false.obs;
  var model = FeedModel().obs;
  var model2 = FeedModel().obs;
  var images = "".obs;
  @override
  void onInit() async {
    tabController = TabController(length: 2, vsync: this);
    await fetchPosts();
    await fetchAnnouncements();
    images.value = box.read("uimage");
    print(images);
    super.onInit();
  }

  Future<void> fetchPosts() async {
    isLoading.value = true;
    var response = await service.getPosts();
    if (response != null) {
      model.value = response;
      isLoading.value = false;
    }
    if (response == null) {
      Get.snackbar(
        "Hata",
        "Sunucu hatası",
        snackPosition: SnackPosition.BOTTOM,
        colorText: Colors.white,
        backgroundColor: Colors.red,
        icon: const Icon(Icons.add_alert),
      );
      isLoading.value = false;
    }
    isLoading.value = false;
  }

  Future<void> removePost(String? uid) async {
    try {
      isLoading.value = true;
      var response = await service.removePost(uid);
      if (response != null && response == true) {
        await fetchPosts();
        isLoading.value = false;
        Get.snackbar(
          "Başarılı",
          "Post Başarıyla Kaldırıldı",
          snackPosition: SnackPosition.BOTTOM,
          colorText: Colors.white,
          backgroundColor: Colors.blue,
          icon: const Icon(Icons.add_alert),
        );
      } else {
        Get.snackbar(
          "Hata",
          "Sunucu hatası",
          snackPosition: SnackPosition.BOTTOM,
          colorText: Colors.white,
          backgroundColor: Colors.red,
          icon: const Icon(Icons.add_alert),
        );
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> fetchAnnouncements() async {
    isLoading.value = true;
    var response = await service.getAnnouncements();
    if (response != null) {
      model2.value = response;
      isLoading.value = false;
    }
    if (response == null) {
      Get.snackbar(
        "Hata",
        "Sunucu hatası",
        snackPosition: SnackPosition.BOTTOM,
        colorText: Colors.white,
        backgroundColor: Colors.red,
        icon: const Icon(Icons.add_alert),
      );
      isLoading.value = false;
    }
    isLoading.value = false;
  }
}
