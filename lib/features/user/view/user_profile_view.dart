import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:technicmate/constants/asset_constants.dart';
import 'package:technicmate/features/user/controller/user_profile_controller.dart';
import 'package:technicmate/theme/theme.dart';

class UserProfileView extends StatelessWidget {
  UserProfileView({super.key});
  final controller = Get.put(UserProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                  backgroundColor: Palette.chatBlueButtonColor,
                  backgroundImage: NetworkImage("${controller.userModel.value.data?.profileImageData.toString()}"),
                  radius: 40,
                ),
                UserProfileCustomStatic(count: controller.userModel.value.data?.noteCount?.toInt(), title: "Not"),
                UserProfileCustomStatic(count: controller.userModel.value.data?.followerCount, title: "Takipçi"),
                UserProfileCustomStatic(count: controller.userModel.value.data?.followedByCount, title: "Takip"),
              ],
            ),
            const SizedBox(height: 10),
            Text("${controller.userModel.value.data?.firstname} ${controller.userModel.value.data?.lastname}",
                style: GoogleFonts.inter(fontSize: 20, fontWeight: FontWeight.bold, color: Palette.white)),
            const SizedBox(height: 10),
            const UserProfileCustomClassNumberIndicator(),
            const SizedBox(height: 10),
            Text(
              "Here to change.",
              style: GoogleFonts.inter(color: Palette.textGrey9999),
            ),
            const SizedBox(height: 10),
            Center(
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(MediaQuery.of(context).size.width, 35),
                ),
                child: Text("Takip Et", style: GoogleFonts.inter(fontSize: 16, color: Palette.white)),
              ),
            ),
            const SizedBox(height: 5),
            TabBar(
              controller: controller.tabController,
              tabs: const [
                Tab(
                  child: Text("Paylaşımlar"),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Expanded(
              child: TabBarView(
                controller: controller.tabController,
                children: [
                  Obx(
                    () {
                      if (controller.isLoading.value == true) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (controller.feedModel.value.data == null) {
                        return const Center(
                          child: Text("Veri alınamadı"),
                        );
                      } else {
                        return ListView.separated(
                          physics: const BouncingScrollPhysics(),
                          itemCount: controller.feedModel.value.data?.length ?? 0,
                          separatorBuilder: (context, index) => const Divider(
                            color: Palette.seperatorGrey,
                          ),
                          itemBuilder: (context, index) {
                            var data = controller.feedModel.value.data;
                            return Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  InkWell(
                                    onTap: () async {
                                      UserProfileController controller2 = Get.put(UserProfileController());
                                      String selectedUserId = controller.feedModel.value.data![index].user!.userId.toString();
                                      controller2.userId = selectedUserId;
                                      await controller2.fetchPosts(selectedUserId);
                                      Get.to(UserProfileView());
                                    },
                                    child: const CircleAvatar(
                                      radius: 24,
                                      backgroundImage: NetworkImage(
                                        'https://pbs.twimg.com/profile_images/1622557245950107648/jq2sqW7i_400x400.jpg',
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 10), // Boşluk ekledim
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Expanded(
                                              child: Row(
                                                children: [
                                                  Flexible(
                                                    flex: 2,
                                                    child: Text(
                                                      "${data![index].user?.firstname} ${data[index].user?.lastname} ",
                                                      style: GoogleFonts.inter(
                                                        fontWeight: FontWeight.w700,
                                                        fontSize: 16,
                                                      ),
                                                      overflow: TextOverflow.ellipsis,
                                                    ),
                                                  ),
                                                  const SizedBox(width: 5),
                                                  Flexible(
                                                    flex: 1,
                                                    child: Text(
                                                      "${data[index].user?.email}",
                                                      overflow: TextOverflow.ellipsis,
                                                      style: GoogleFonts.inter(
                                                        fontSize: 12,
                                                        color: Palette.usernameGrey,
                                                      ),
                                                    ),
                                                  ),
                                                  const SizedBox(width: 5),
                                                  Flexible(
                                                    child: Text(
                                                      "• 5Dk",
                                                      overflow: TextOverflow.ellipsis,
                                                      style: GoogleFonts.inter(
                                                        fontSize: 12,
                                                        color: Palette.usernameGrey,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            SvgPicture.asset(
                                              AssetConstants.threeDotsOption,
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 5),
                                        if (data[index].text != null) ...[
                                          Text(
                                            data[index].text.toString(),
                                            style: GoogleFonts.cabin(fontSize: 16),
                                            textAlign: TextAlign.start,
                                          ),
                                        ],
                                        const SizedBox(height: 10),
                                        if (data[index].additionals == null && data[index].additionals!.isEmpty) ...[
                                          Center(
                                            child: ClipRRect(
                                              borderRadius: BorderRadius.circular(8.0),
                                              child: Image.network(
                                                "https://pbs.twimg.com/media/GNyYwBeWYAAzq6f?format=jpg&name=4096x4096",
                                                fit: BoxFit.contain,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class UserProfileCustomClassNumberIndicator extends StatelessWidget {
  const UserProfileCustomClassNumberIndicator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      spacing: 5,
      children: [
        Container(
          decoration: BoxDecoration(
            color: Palette.loginButtonBlueColor,
            borderRadius: BorderRadius.circular(
              10,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            child: Text.rich(
              TextSpan(
                text: 'Fizik ',
                style: GoogleFonts.inter(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black),
                children: <InlineSpan>[
                  TextSpan(
                    text: '1/4',
                    style: GoogleFonts.inter(fontSize: 15, fontWeight: FontWeight.bold, color: Palette.white),
                  ),
                ],
              ),
            ),
          ),
        ),
        SvgPicture.asset(AssetConstants.uniCap),
      ],
    );
  }
}

class UserProfileCustomStatic extends StatelessWidget {
  UserProfileCustomStatic({
    super.key,
    required this.count,
    required this.title,
  });
  final int? count;
  final String title;
  final formatter = NumberFormat('#,##,000');
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(formatter.format(count), style: GoogleFonts.inter(fontSize: 15, color: Palette.white)),
        Text(title, style: GoogleFonts.inter(fontSize: 15, color: Palette.white)),
      ],
    );
  }
}
