import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:technicmate/constants/asset_constants.dart';
import 'package:technicmate/features/user/controller/user_profile_controller.dart';
import 'package:technicmate/theme/theme.dart';

class UserProfileView extends StatefulWidget {
  const UserProfileView({super.key, required this.userId});
  final String userId;

  @override
  State<UserProfileView> createState() => _UserProfileViewState();
}

class _UserProfileViewState extends State<UserProfileView>
    with SingleTickerProviderStateMixin {
  final controller = Get.put(UserProfileController());
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 1, vsync: this);
    controller.fetchUserDetail(widget.userId);
    super.initState();
  }

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
                  radius: 40,
                  backgroundImage: NetworkImage(
                    controller.userModel.value.data?.profileImageData ??
                        AssetConstants.defaultProfileImage,
                  ),
                ),
                Obx(() => UserProfileCustomStatic(
                    count: controller.userModel.value.data?.noteCount ?? 0,
                    title: "${widget.userId}")),
                UserProfileCustomStatic(
                    count: controller.userModel.value.data?.followerCount ?? 0,
                    title: "Takipçi"),
                UserProfileCustomStatic(
                    count:
                        controller.userModel.value.data?.followedByCount ?? 0,
                    title: "Takip"),
              ],
            ),
            const SizedBox(height: 10),
            Text(
              "${controller.userModel.value.data?.firstname} ${controller.userModel.value.data?.lastname}",
              style: GoogleFonts.inter(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Palette.white),
            ),
            Text(
              controller.userModel.value.data?.university?.title ?? "",
              style: GoogleFonts.inter(
                  fontSize: 13,
                  fontWeight: FontWeight.w300,
                  color: Palette.white),
            ),
            const SizedBox(height: 10),
            UserProfileCustomClassNumberIndicator(
                department:
                    controller.userModel.value.data?.department?.title ?? ""),
            const SizedBox(height: 10),
            Text(
              controller.userModel.value.data?.biography ?? "",
              style: GoogleFonts.inter(color: Palette.textGrey9999),
            ),
            const SizedBox(height: 10),
            const SizedBox(height: 5),
            TabBar(
              controller: tabController,
              tabs: const [
                Tab(
                  child: Text("Paylaşımlar"),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Expanded(
              child: TabBarView(
                controller: tabController,
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
                          itemCount:
                              controller.feedModel.value.data?.length ?? 0,
                          separatorBuilder: (context, index) => const Divider(
                            color: Palette.seperatorGrey,
                          ),
                          itemBuilder: (context, index) {
                            var data = controller.feedModel.value.data;
                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Stack(
                                    children: [
                                      CircleAvatar(
                                        radius: 24,
                                        backgroundImage: NetworkImage(
                                          data?[index].user?.profileImageData ??
                                              AssetConstants
                                                  .defaultProfileImage,
                                        ),
                                      ),
                                      getIconForPostType(
                                          data?[index].postTypeId),
                                    ],
                                  ),
                                  const SizedBox(width: 10), // Boşluk ekledim
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
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
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        fontSize: 16,
                                                      ),
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                    ),
                                                  ),
                                                  const SizedBox(width: 5),
                                                  Flexible(
                                                    flex: 1,
                                                    child: Text(
                                                      "${data[index].user?.email}",
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: GoogleFonts.inter(
                                                        fontSize: 12,
                                                        color: Palette
                                                            .usernameGrey,
                                                      ),
                                                    ),
                                                  ),
                                                  const SizedBox(width: 5),
                                                  Flexible(
                                                    child: Text(
                                                      "• ${data[index].createdAt}",
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: GoogleFonts.inter(
                                                        fontSize: 12,
                                                        color: Palette
                                                            .usernameGrey,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            // SvgPicture.asset(
                                            //   AssetConstants.threeDotsOption,
                                            // ),
                                            data[index].user?.userId ==
                                                    controller.box.read("uid")
                                                ? IconButton(
                                                    onPressed: () async {
                                                      await controller
                                                          .removePost(
                                                              data[index]
                                                                  .postId,
                                                              data[index]
                                                                  .user!
                                                                  .userId
                                                                  .toString());
                                                    },
                                                    icon: const Icon(
                                                        Icons.remove),
                                                  )
                                                : const SizedBox(),
                                          ],
                                        ),
                                        const SizedBox(height: 5),
                                        if (data[index].text != null) ...[
                                          Text(
                                            data[index].text.toString(),
                                            style:
                                                GoogleFonts.cabin(fontSize: 16),
                                            textAlign: TextAlign.start,
                                          ),
                                        ],
                                        const SizedBox(height: 10),
                                        if (data[index].additionals == null &&
                                            data[index]
                                                .additionals!
                                                .isEmpty) ...[
                                          Center(
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
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

Widget getIconForPostType(int? postTypeId) {
  if (postTypeId == 3) {
    return const SizedBox();
  } else if (postTypeId == 2) {
    return SvgPicture.asset(AssetConstants.iconInfo);
  } else if (postTypeId == 1) {
    return SvgPicture.asset(AssetConstants.iconQuestion);
  } else {
    return const SizedBox();
  }
}

class UserProfileCustomClassNumberIndicator extends StatelessWidget {
  const UserProfileCustomClassNumberIndicator({
    super.key,
    required this.department,
  });

  final String department;

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
                text: department,
                style: GoogleFonts.inter(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Palette.loginButtonDarkBlueColor),
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
  const UserProfileCustomStatic({
    super.key,
    required this.count,
    required this.title,
  });
  final int? count;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(count.toString(),
            style: GoogleFonts.inter(fontSize: 15, color: Palette.white)),
        Text(title,
            style: GoogleFonts.inter(fontSize: 15, color: Palette.white)),
      ],
    );
  }
}
