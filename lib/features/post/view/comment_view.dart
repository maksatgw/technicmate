import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:technicmate/features/post/controller/post_controller.dart';

class CommentView extends StatelessWidget {
  CommentView({super.key});
  var postController = Get.put(PostController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
    );
  }
}
