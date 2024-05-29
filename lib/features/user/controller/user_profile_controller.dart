import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:technicmate/features/feed/controller/feed_controller.dart';
import 'package:technicmate/features/feed/model/feed_model.dart';
import 'package:technicmate/features/feed/service/feed_service.dart';
import 'package:technicmate/features/user/model/user_profile_model.dart';
import 'package:technicmate/features/user/service/user_profile_service.dart';

class UserProfileController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late TabController tabController;
  final UserProfileService service = UserProfileService();
  final FeedService service2 = FeedService();
  final controller3 = Get.put(FeedController());
  final box = GetStorage();

  var isLoading = false.obs;
  var feedModel = FeedModel().obs;
  var userModel = UserProfileModel().obs;
  String userId = "";
  @override
  void onInit() async {
    tabController = TabController(length: 1, vsync: this);
    super.onInit();
  }

  Future<void> fetchUserDetail(String userId) async {
    isLoading.value = true;
    var response = await service.getUserProfile(userId);
    if (response != null) {
      userModel.value = response;
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

  Future<void> removePost(String? uid, String userId) async {
    try {
      isLoading.value = true;
      var response = await service2.removePost(uid);
      if (response != null && response == true) {
        await fetchPosts(userId);
        await fetchUserDetail(userId);
        await controller3.fetchPosts();
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

  Future<void> fetchPosts(String userId) async {
    isLoading.value = true;
    var response = await service.getPostsByUserId(userId);
    if (response != null) {
      feedModel.value = response;
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
