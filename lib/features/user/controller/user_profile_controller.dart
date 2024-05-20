import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:technicmate/features/feed/model/feed_model.dart';
import 'package:technicmate/features/user/service/user_profile_service.dart';

class UserProfileController extends GetxController with GetSingleTickerProviderStateMixin {
  late TabController tabController;
  final UserProfileService service = UserProfileService();
  var isLoading = false.obs;
  var model = FeedModel().obs;

  @override
  void onInit() {
    tabController = TabController(length: 2, vsync: this);
    fetchPosts(1);
    super.onInit();
  }

  Future<void> fetchPosts(int userId) async {
    isLoading.value = true;
    var response = await service.getPostsByUserId(userId);
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
}
