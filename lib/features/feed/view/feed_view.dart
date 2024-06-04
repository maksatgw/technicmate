import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:technicmate/constants/constants.dart';
import 'package:technicmate/features/feed/controller/feed_controller.dart';
import 'package:technicmate/features/feed/view/announcement_view.dart';
import 'package:technicmate/features/feed/view/sharing_view.dart';
import 'package:technicmate/features/splash/view/splash_view.dart';
import 'package:technicmate/features/user/view/user_profile_view.dart';

class FeedView extends StatelessWidget {
  FeedView({super.key});
  final controller = Get.put(FeedController());
  // final homeController = Get.find<HomeController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              title: const Text("Çıkış"),
              onTap: () {
                controller.box.remove("bearer");
                controller.box.remove("uimage");
                Get.offAll(() => SplashView());
              },
            )
          ],
        ),
      ),
      appBar: AppBar(
        leadingWidth: 80,
        leading: IconButton(
          onPressed: () {
            controller.isDrawer = !controller.isDrawer;
            // if (controller.isDrawer = true) {
            //   homeController.sliderDrawerKey.currentState!.openSlider();
            // } else {
            //   homeController.sliderDrawerKey.currentState!.closeSlider();
            // }
          },
          icon: SvgPicture.asset(
            AssetConstants.technicMateLogoWhite,
            height: 30,
            width: 30,
            fit: BoxFit.contain,
          ),
        ),
        actions: [
          Obx(() {
            if (controller.images.isNotEmpty) {
              return InkWell(
                onTap: () async {
                  String selectedUserId = controller.box.read('uid');
                  Get.to(
                    UserProfileView(
                      userId: selectedUserId,
                    ),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: CircleAvatar(
                    minRadius: 16,
                    child: ClipOval(
                      child: Image.network(
                        controller.images.value,
                        width: 40,
                        height: 40,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              );
            }
            if (controller.images.isEmpty) {
              return const Center(
                child: Text("Öğe yok"),
              );
            } else {
              return const CircularProgressIndicator();
            }
          }),
          const SizedBox(width: 10),
        ],
        bottom: TabBar(
          controller: controller.tabController,
          tabs: [
            Tab(
              child: Text(
                "Paylaşımlar",
                style: GoogleFonts.cabin(fontSize: 20),
              ),
            ),
            Tab(
              child: Text(
                "Duyurular",
                style: GoogleFonts.cabin(fontSize: 20),
              ),
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: controller.tabController,
        children: [
          SharingView(),
          AnnouncementView(),
        ],
      ),
    );
  }
}
