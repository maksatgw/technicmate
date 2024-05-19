import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:technicmate/features/feed/model/feed_model.dart';
import 'package:technicmate/features/feed/service/feed_service.dart';

class FeedController extends GetxController with GetSingleTickerProviderStateMixin {
  late TabController tabController;
  final FeedService service = FeedService();
  var model = FeedModel().obs;
  @override
  void onInit() async {
    tabController = TabController(length: 2, vsync: this);
    var response = await service.getPosts();
    if (response != null) {
      model.value = response;
    }
    super.onInit();
  }
}
