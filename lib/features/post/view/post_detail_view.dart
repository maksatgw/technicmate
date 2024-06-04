import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:technicmate/common/commons.dart';
import 'package:technicmate/features/home/view/home_view.dart';
import 'package:technicmate/features/post/controller/post_controller.dart';
import 'package:technicmate/theme/theme.dart';

class PostDetailView extends StatefulWidget {
  const PostDetailView(
      {super.key, required this.postId, required this.isFirstInit});
  final String? postId;
  final bool isFirstInit;

  @override
  State<PostDetailView> createState() => _PostDetailViewState();
}

class _PostDetailViewState extends State<PostDetailView> {
  final controller = Get.put(PostController());

  @override
  void initState() {
    super.initState();
    if (widget.isFirstInit) {
      controller.ids.add(widget.postId);
    }
    print(controller.ids.length);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.fetchPostById(widget.postId ?? "");
      controller.fetchPostComments(widget.postId ?? "");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Post"),
        leading: BackButton(
          onPressed: () {
            if (controller.ids.length == 1) {
              Get.off(() => HomeView());
            } else {
              controller.ids.removeAt(controller.ids.length - 1);
              print(controller.ids);
              Get.off(
                () => PostDetailView(
                  postId: controller.ids.last,
                  isFirstInit: false,
                ),
                preventDuplicates: false,
              );
            }
          },
        ),
      ),
      body: Obx(() {
        if (controller.isLoading.isTrue) {
          return const Center(child: CircularProgressIndicator());
        }
        if (controller.postModel.value.data == null) {
          return const Center(child: Text("data"));
        }
        return _buildPostDetail();
      }),
    );
  }

  Widget _buildPostDetail() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  CustomPostCard(data: controller.postModel.value.data),
                  const Divider(color: Palette.seperatorGrey),
                  CustomPostCardDeatilActions(
                      post: controller.postModel.value.data),
                  const Divider(color: Palette.seperatorGrey),
                  _buildCommentsList(),
                ],
              ),
            ),
          ),
          _buildCommentInput(),
        ],
      ),
    );
  }

  Widget _buildCommentsList() {
    return ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: controller.feedModel.value.data?.length ?? 0,
      separatorBuilder: (context, index) =>
          const Divider(color: Palette.seperatorGrey),
      itemBuilder: (context, index) {
        var post = controller.feedModel.value.data?[index];
        return InkWell(
          onTap: () {
            controller.ids.add(post?.postId);
            print(controller.ids);
            print(controller.ids.length);
            Get.to(
              () => PostDetailView(
                postId: post?.postId,
                isFirstInit: false,
              ),
              arguments: {"id": post?.postId},
              preventDuplicates: false,
            );
          },
          child: Column(
            children: [
              CustomPostCard(data: post),
              CustomPostCardDeatilActions(post: post),
            ],
          ),
        );
      },
    );
  }

  Widget _buildCommentInput() {
    return Wrap(
      children: [
        TextField(
          controller: controller.commentInputController,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide: BorderSide.none,
            ),
            filled: true,
            fillColor: Palette.authTextFieldFillColor,
            hintText: "Yazmak için tıkla...",
            hintStyle: GoogleFonts.inter(fontSize: 13),
            suffixIcon: IconButton(
              onPressed: () async {
                await controller.postComment();
                await controller.fetchPostComments(widget.postId ?? "");
              },
              icon: const Icon(Icons.send),
            ),
          ),
        ),
      ],
    );
  }
}
