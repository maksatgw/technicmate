import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:technicmate/common/commons.dart';
import 'package:technicmate/features/post/view/post_detail_view.dart';
import 'package:technicmate/theme/theme.dart';
import 'package:technicmate/features/feed/controller/feed_controller.dart';

class SharingView extends StatelessWidget {
  SharingView({super.key});
  final controller = Get.put(FeedController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Obx(
          () {
            if (controller.isLoading.value) {
              return const Center(child: CircularProgressIndicator());
            }
            final feedPostModel = controller.feedPostModel.value;
            final data = feedPostModel.data;
            final error = feedPostModel.error;
            if (error != null) {
              return const Center(child: Text("Sunucu hatası"));
            }
            if (data == null) {
              return const Center(child: Text("Veri alınamadı"));
            }
            if (data.isEmpty) {
              return const Center(
                  child: Text("Buralar sakin. İlk olmak ister misin?"));
            }
            return RefreshIndicator(
              triggerMode: RefreshIndicatorTriggerMode.anywhere,
              onRefresh: () async {
                await controller.fetchPosts();
              },
              child: ListView.separated(
                physics: const AlwaysScrollableScrollPhysics(),
                itemCount: data.length,
                separatorBuilder: (context, index) => const Divider(
                  color: Palette.seperatorGrey,
                ),
                itemBuilder: (context, index) {
                  return InkWell(
                    onDoubleTap: () {
                      print("double tapped");
                    },
                    onTap: () {
                      Get.to(
                        () => PostDetailView(postId: data[index].postId),
                        arguments: {
                          "id": data[index].postId,
                        },
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      child: Column(
                        children: [
                          CustomPostCard(
                            data: data[index],
                          ),
                          Obx(() => CustomPostCardDeatilActions(
                                post:
                                    controller.feedPostModel.value.data?[index],
                              )),
                        ],
                      ),
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
