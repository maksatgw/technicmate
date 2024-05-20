import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:technicmate/features/feed/view/feed_view.dart';
import 'package:technicmate/features/post/view/post_add_view.dart';
import 'package:technicmate/features/search/view/search_view.dart';

class HomeController extends GetxController {
  var currentIndex = 0.obs;

  void changePage(int index) {
    currentIndex.value = index;
  }

  final List<Widget> pages = [
    FeedView(),
    PostAddView(),
    SearchView(),
  ];
}
