import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:technicmate/constants/constants.dart';
import 'package:technicmate/features/feed/controller/feed_controller.dart';
import 'package:technicmate/features/feed/view/sharing_view.dart';

class FeedView extends StatelessWidget {
  FeedView({super.key});
  final controller = Get.put(FeedController());
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 75,
        leading: IconButton(
          onPressed: () {},
          icon: SvgPicture.asset(
            AssetConstants.technicMateLogoWhite,
            height: 40,
            width: 40,
            fit: BoxFit.contain,
          ),
        ),
        actions: const [
          CircleAvatar(),
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
