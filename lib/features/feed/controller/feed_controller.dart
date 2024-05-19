import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:technicmate/features/feed/service/feed_service.dart';

class FeedController extends GetxController with GetSingleTickerProviderStateMixin {
  late TabController tabController;
  final FeedService service = FeedService();
  @override
  void onInit() async {
    tabController = TabController(length: 2, vsync: this);
    await service.getPosts();
    super.onInit();
  }
}
