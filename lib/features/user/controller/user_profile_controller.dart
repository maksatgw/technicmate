import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:technicmate/features/feed/model/feed_model.dart';
import 'package:technicmate/features/user/model/user_profile_model.dart';
import 'package:technicmate/features/user/service/user_profile_service.dart';

class UserProfileController extends GetxController with GetSingleTickerProviderStateMixin {
  late TabController tabController;
  final UserProfileService service = UserProfileService();
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
