import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:technicmate/constants/constants.dart';
import 'package:technicmate/features/feed/controller/feed_controller.dart';
import 'package:technicmate/features/user/controller/user_profile_controller.dart';
import 'package:technicmate/features/user/view/user_profile_view.dart';
import 'package:technicmate/theme/theme.dart';

class AnnouncementView extends StatelessWidget {
  AnnouncementView({super.key});
  final controller = Get.put(FeedController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Obx(
          () {
            if (controller.isLoading.value == true) {
              return const Center(child: CircularProgressIndicator());
            }
            if (controller.model2.value.data == null) {
              return const Center(
                child: Text("Veri alınamadı"),
              );
            }
            if (controller.model2.value.data!.isEmpty) {
              return const Center(
                child: Text("Buralar sakin. İlk olmak ister misin?"),
              );
            } else {
              return RefreshIndicator(
                onRefresh: () async {
                  await controller.fetchAnnouncements();
                },
                child: ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  itemCount: controller.model2.value.data?.length ?? 0,
                  separatorBuilder: (context, index) => const Divider(
                    color: Palette.seperatorGrey,
                  ),
                  itemBuilder: (context, index) {
                    var data = controller.model2.value.data;
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Stack(
                            children: [
                              CircleAvatar(
                                radius: 24,
                                backgroundImage: NetworkImage(
                                  data?[index].user?.profileImageData ?? AssetConstants.defaultProfileImage,
                                ),
                              ),
                              getIconForPostType(data?[index].postTypeId),
                            ],
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
                                              "• ${data[index].createdAt}",
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
                ),
              );
            }
          },
        ),
      ),
    );
  }
}

Widget getIconForPostType(int? postTypeId) {
  if (postTypeId == 3) {
    return SizedBox();
  } else if (postTypeId == 2) {
    return SvgPicture.asset(AssetConstants.iconInfo);
  } else if (postTypeId == 1) {
    return SvgPicture.asset(AssetConstants.iconQuestion);
  } else {
    return SizedBox();
  }
}
