import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:technicmate/features/feed/model/feed_model.dart';
import 'package:technicmate/features/feed/service/feed_service.dart';

class FeedController extends GetxController with GetSingleTickerProviderStateMixin {
  late TabController tabController;
  final FeedService service = FeedService();
  final GlobalKey<ScaffoldState> key = GlobalKey();

  var isLoading = false.obs;
  var model = FeedModel().obs;
  @override
  void onInit() async {
    tabController = TabController(length: 2, vsync: this);
    await fetchUsers();
    super.onInit();
  }

  Future<void> fetchUsers() async {
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
}
