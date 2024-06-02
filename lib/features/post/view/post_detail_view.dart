import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:technicmate/common/commons.dart';
import 'package:technicmate/features/post/controller/post_controller.dart';
import 'package:technicmate/theme/theme.dart';

class PostDetailView extends StatefulWidget {
  const PostDetailView({super.key, required this.postId});
  final String? postId;

  @override
  State<PostDetailView> createState() => _PostDetailViewState();
}

class _PostDetailViewState extends State<PostDetailView> {
  final controller = Get.put(PostController());

  @override
  void initState() {
    // controller.fetchPostById(widget.postId ?? "");
    // print(widget.postId);
    // controller.fetchPostComments(widget.postId ?? "");
    // super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.fetchPostById(widget.postId ?? "");
      controller.fetchPostComments(widget.postId ?? "");
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Post"),
      ),
      body: Obx(() {
        if (controller.isLoading.isTrue) {
          return const Center(child: CircularProgressIndicator());
        }
        if (controller.postModel.value.data == null) {
          return const Center(child: Text("data"));
        } else {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              children: [
                CustomPostCard(
                  data: controller.postModel.value.data,
                ),
                const Divider(
                  color: Palette.seperatorGrey,
                ),
                CustomPostCardDeatilActions(
                  post: controller.postModel.value.data,
                ),
                const Divider(
                  color: Palette.seperatorGrey,
                ),
                Expanded(
                  child: ListView.separated(
                    separatorBuilder: (context, index) => const Divider(
                      color: Palette.seperatorGrey,
                    ),
                    itemCount: controller.feedModel.value.data?.length ?? 0,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          var postId =
                              controller.feedModel.value.data?[index].postId;
                          print(postId);
                          // Navigator.of(context).push(MaterialPageRoute(
                          //   builder: (context) =>
                          //       PostDetailView(postId: postId),
                          // ));
                          // Get.to(
                          //   () => PostDetailView(postId: postId),
                          //   arguments: {"id": postId}, // Doğru parametre yapısı
                          //   preventDuplicates: false,
                          // );
                          Get.to(
                            () => PostDetailView(postId: postId),
                            arguments: {"id": postId}, // Doğru parametre yapısı
                            preventDuplicates: false,
                          );
                        },
                        child: Column(
                          children: [
                            CustomPostCard(
                              data: controller.feedModel.value.data?[index],
                            ),
                            CustomPostCardDeatilActions(
                              post: controller.feedModel.value.data?[index],
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6),
                        borderSide: BorderSide.none),
                    filled: true,
                    fillColor: Palette.authTextFieldFillColor,
                    hintText: "Yazmak için tıkla...",
                    hintStyle: GoogleFonts.inter(fontSize: 13),
                  ),
                ),
              ],
            ),
          );
        }
      }),
    );
  }
}
