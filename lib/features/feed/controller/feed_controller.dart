import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:technicmate/constants/constants.dart';
import 'package:technicmate/features/feed/model/feed_model.dart';
import 'package:technicmate/features/feed/service/feed_service.dart';
import 'package:technicmate/features/home/view/home_view.dart';

class FeedController extends GetxController
    with GetSingleTickerProviderStateMixin {
  var feedPostModel = FeedModel().obs;
  var feedAnnounceModel = FeedModel().obs;

  final FeedService service = FeedService();

  final box = GetStorage();

  var images = AssetConstants.defaultProfileImage.obs;
  var isLoading = false.obs;

  var isDrawer = false;

  var scaffoldKey = GlobalKey<ScaffoldState>();

  late TabController tabController;

  @override
  void onInit() async {
    //TabBar Initialize
    tabController = TabController(length: 2, vsync: this);
    //postları çek.
    await fetchPosts();
    //duyuruları çek.
    await fetchAnnouncements();
    //Profil Image'ını cache'e yaz.
    images.value = box.read("uimage");

    super.onInit();
  }

  void openDrawer() {
    scaffoldKey.currentState?.openDrawer();
  }

  void closeDrawer() {
    scaffoldKey.currentState?.openEndDrawer();
  }

  Future<void> fetchPosts() async {
    //Loading indicator çalıştır
    isLoading.value = true;
    //servisten postları al.
    var response = await service.getPosts();
    if (response != null) {
      //postmodele response'tan gelen datayı ver.
      feedPostModel.value = response;
      //Loading indicator bitir.
      isLoading.value = false;
    }
    if (response == null) {
      //Loading indicator bitir.
      isLoading.value = false;
      //SnackBar Hata Mesajı döndür.
      Get.snackbar(
        "Hata",
        "Sunucu hatası",
        snackPosition: SnackPosition.BOTTOM,
        colorText: Colors.white,
        backgroundColor: Colors.red,
        icon: const Icon(Icons.add_alert),
      );
    }
    //Loading indicator bitir.
    isLoading.value = false;
  }

  Future<void> fetchAnnouncements() async {
    //Loading indicator başlat.
    isLoading.value = true;
    //Duyuruları servisten çek.
    var response = await service.getAnnouncements();
    if (response != null) {
      //Duyuru modeline atamayı yap.
      feedAnnounceModel.value = response;
      //Loading indicator bitir.
      isLoading.value = false;
    }
    if (response == null) {
      //Loading indicator bitir.
      isLoading.value = false;
      //Hata Mesajını ver.
      Get.snackbar(
        "Hata",
        "Sunucu hatası",
        snackPosition: SnackPosition.BOTTOM,
        colorText: Colors.white,
        backgroundColor: Colors.red,
        icon: const Icon(Icons.add_alert),
      );
    }
    //Loading indicator bitir.
    isLoading.value = false;
  }

  Future<void> removePost(String? uid) async {
    try {
      isLoading.value = true;
      var response = await service.removePost(uid);
      if (response != null && response == true) {
        await fetchPosts();
        isLoading.value = false;
        Get.offAll(() => HomeView());
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
}
