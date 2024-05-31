import 'package:flutter/material.dart';
import 'package:flutter_glow/flutter_glow.dart';
import 'package:get/get.dart';
import 'package:like_button/like_button.dart';
import 'package:technicmate/common/commons.dart';
import 'package:technicmate/common/models/models.dart';
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
    controller.fetchPostById(widget.postId ?? "");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Post"),
      ),
      body: Column(
        children: [
          Obx(
            () => CustomPostCard(
              data: controller.postModel.value.data,
            ),
          ),
          Obx(() => CustomPostCardDeatilActions(
                post: controller.postModel.value.data,
              )),
          // Obx(
          //   () => Expanded(
          //     child: ListView.separated(
          //       separatorBuilder: (context, index) =>
          //           const Divider(color: Palette.seperatorGrey),
          //       itemCount: controller.feedPostModel.value.data?.length ?? 0,
          //       itemBuilder: (context, index) {
          //         return Obx(
          //           () => CustomPostCard(
          //             data: controller.feedPostModel.value.data?[index],
          //           ),
          //         );
          //       },
          //     ),
          //   ),
          // ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Type your comment',
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CustomPostCardDeatilActions extends StatelessWidget {
  const CustomPostCardDeatilActions({
    super.key,
    required this.post,
  });

  final PostModel? post;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          const Divider(
            color: Palette.seperatorGrey,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Wrap(
                children: [
                  LikeButton(
                    likeCount: post?.likeCount,
                    size: 25,
                    circleColor: const CircleColor(
                        start: Palette.tmMainBlue,
                        end: Palette.chatBlueButtonColor),
                    bubblesColor: const BubblesColor(
                        dotPrimaryColor: Palette.chatBlueButtonColor,
                        dotSecondaryColor: Palette.chatBubbleDarkBlueColor),
                  ),
                ],
              ),
              if (post?.postTypeId == 1) ...[
                GlowButton(
                  height: 30,
                  borderRadius: BorderRadius.circular(15),
                  color: Palette.questionPostTypeYellow,
                  glowColor: Palette.black,
                  onPressed: () {},
                  child: Text(
                    "pinle",
                    style: GoogleFonts.inter(color: Palette.black),
                  ),
                )
              ],
            ],
          ),
          const Divider(
            color: Palette.seperatorGrey,
          ),
        ],
      ),
    );
  }
}
