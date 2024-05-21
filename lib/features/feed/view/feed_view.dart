import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:technicmate/constants/constants.dart';
import 'package:technicmate/features/auth/login/view/login_view.dart';
import 'package:technicmate/features/feed/controller/feed_controller.dart';
import 'package:technicmate/features/feed/view/sharing_view.dart';
import 'package:technicmate/features/splash/controller/splash_controller.dart';
import 'package:technicmate/features/splash/view/splash_view.dart';

class FeedView extends StatelessWidget {
  FeedView({super.key});
  final controller = Get.put(FeedController());
  final GlobalKey<ScaffoldState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              title: const Text("Çıkış"),
              onTap: () {
                controller.box.remove("bearer");
                controller.box.remove("uimage");
                final find = Get.put(SplashController()).onInit();
                Get.off(() => SplashView());
              },
            )
          ],
        ),
      ),
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => _key.currentState?.openDrawer(),
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
              return CircleAvatar(
                minRadius: 16,
                child: ClipOval(
                  child: Image.network(
                    controller.images.value,
                    width: 40,
                    height: 40,
                    fit: BoxFit.cover,
                  ),
                ),
              );
            }
            if (controller.images.isEmpty) {
              return const Center(
                child: Text("Öğe yok"),
              );
            } else {
              return CircularProgressIndicator();
            }
          }),
          SizedBox(width: 10),
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
                "Etkinlikler",
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
          SharingView(),
        ],
      ),
    );
  }
}
