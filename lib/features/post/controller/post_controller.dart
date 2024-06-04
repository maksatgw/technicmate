import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:technicmate/features/feed/controller/feed_controller.dart';
import 'package:technicmate/features/feed/model/feed_model.dart';
import 'package:technicmate/features/home/view/home_view.dart';
import 'package:technicmate/features/post/model/comment_create_model.dart';
import 'package:technicmate/features/post/model/post_create_model.dart';
import 'package:technicmate/features/post/model/post_get_by_id_model.dart';
import 'package:technicmate/features/post/service/post_service.dart';

class PostController extends GetxController {
  TextEditingController postBodyController = TextEditingController();
  TextEditingController commentInputController = TextEditingController();

  var postCreateModel = PostCreateModel();
  var commentCreateModel = CommentCreateModel();
  var postModel = PostGetByIdModel().obs;
  var feedModel = FeedModel().obs;

  var ids = <String?>[];
  RxInt index = 0.obs;

  FeedController feedController = FeedController();

  final PostService service = PostService();

  var isLoading = false.obs;
  var isSelected = false.obs;
  var selectedValue = 3.obs;
  var isFocused = false.obs;

  Future<void> fetchPostById(String postId) async {
    try {
      isLoading.value = true;
      var response = await service.getPostById(postId);
      if (response?.success == true) {
        if (response != null) {
          postModel.value = response;
          isLoading.value = false;
        }
        isLoading.value = false;
      }
      isLoading.value = false;
    } catch (e) {
      print(e);
    }
  }

  Future<void> postComment() async {
    try {
      commentCreateModel.replyPost = Get.arguments['id'];
      commentCreateModel.postTypeId = "3";
      commentCreateModel.text = commentInputController.text;
      isLoading.value = true;

      var response = await service.createComment(commentCreateModel);
      if (response == true) {
        Get.snackbar(
          "Başarılı",
          "Yorumunuz kaydedildi.",
          snackPosition: SnackPosition.TOP,
          colorText: Colors.white,
          backgroundColor: Colors.blue,
          icon: const Icon(Icons.add_alert),
        );
        commentInputController.clear();
        isLoading.value = false;
      }
      isLoading.value = false;
    } catch (e) {
      print(e);
    }
  }

  Future<void> fetchPostComments(String postId) async {
    try {
      isLoading.value = true;
      var response = await service.getPostComments(postId);
      if (response?.success == true) {
        if (response != null) {
          feedModel.value = response;
          isLoading.value = false;
        }
        isLoading.value = false;
      }
      isLoading.value = false;
    } catch (e) {
      print(e);
    }
  }

  Future<void> likePost(String postId) async {
    try {
      final response = await service.likePost(postId);
      if (response == true) {}
    } catch (e) {
      print(e);
    }
  }

  Future<void> createPost() async {
    try {
      postCreateModel.postTypeId = selectedValue.value;
      postCreateModel.text = postBodyController.text;
      isLoading.value = true;
      var response = await service.createPost(postCreateModel);
      if (response?.success == true) {
        await feedController.fetchPosts();
        Get.snackbar(
          "Başarılı",
          "Postunuz kaydedildi.",
          snackPosition: SnackPosition.TOP,
          colorText: Colors.white,
          backgroundColor: Colors.blue,
          icon: const Icon(Icons.add_alert),
        );
        Get.offAll(() => HomeView());
        isLoading.value = false;
      } else {
        isLoading.value = false;
        Get.snackbar(
          "Hata",
          "Post kaydedilemedi. Lütfen tekrar deneyin.",
          snackPosition: SnackPosition.BOTTOM,
          colorText: Colors.white,
          backgroundColor: Colors.red,
          icon: const Icon(Icons.error),
        );
        await feedController.fetchPosts();
        Get.offAll(() => HomeView());
      }
    } catch (e) {
      print(e);
    }
  }
}
