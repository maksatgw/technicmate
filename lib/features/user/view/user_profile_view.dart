import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:technicmate/common/commons.dart';
import 'package:technicmate/constants/asset_constants.dart';
import 'package:technicmate/features/user/controller/user_profile_controller.dart';
import 'package:technicmate/theme/theme.dart';

class UserProfileView extends StatefulWidget {
  const UserProfileView({super.key, required this.userId});
  final String? userId;

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
    controller.fetchUserDetail(widget.userId ?? "");
    controller.fetchPosts(widget.userId ?? "");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Obx(
          () {
            if (controller.isLoading.isTrue) {
              return const Center(child: CircularProgressIndicator());
            }
            return _buildUserProfile();
          },
        ),
      ),
    );
  }

  Widget _buildUserProfile() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildProfileHeader(),
        const SizedBox(height: 10),
        _buildUserNameAndUniversity(),
        const SizedBox(height: 10),
        UserProfileCustomClassNumberIndicator(
          department: controller.userModel.value.data?.department?.title ?? "",
        ),
        const SizedBox(height: 10),
        _buildBiography(),
        const SizedBox(height: 5),
        if (controller.userModel.value.data?.userId !=
            controller.box.read('uid')) ...[
          _buildFollowButton(),
        ],
        const SizedBox(height: 5),
        _buildTabBar(),
        const SizedBox(height: 10),
        _buildTabBarView(),
      ],
    );
  }

  Widget _buildProfileHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CircleAvatar(
          radius: 40,
          backgroundImage: NetworkImage(
            controller.userModel.value.data?.profileImageData ??
                AssetConstants.defaultProfileImage,
          ),
        ),
        UserProfileCustomStatic(
          count: controller.userModel.value.data?.noteCount ?? 0,
          title: "Paylaşım",
        ),
        UserProfileCustomStatic(
          count: controller.userModel.value.data?.followerCount ?? 0,
          title: "Takipçi",
        ),
        UserProfileCustomStatic(
          count: controller.userModel.value.data?.followedByCount ?? 0,
          title: "Takip",
        ),
      ],
    );
  }

  Widget _buildUserNameAndUniversity() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "${controller.userModel.value.data?.firstname} ${controller.userModel.value.data?.lastname}",
          style: GoogleFonts.inter(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Palette.white,
          ),
        ),
        Text(
          controller.userModel.value.data?.university?.title ?? "",
          style: GoogleFonts.inter(
            fontSize: 13,
            fontWeight: FontWeight.w300,
            color: Palette.white,
          ),
        ),
      ],
    );
  }

  Widget _buildBiography() {
    return Text(
      controller.userModel.value.data?.biography ?? "",
      style: GoogleFonts.inter(color: Palette.textGrey9999),
    );
  }

  Widget _buildFollowButton() {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
        onPressed: () async {
          await controller
              .followUser(controller.userModel.value.data?.userId ?? "");
          await controller.fetchUserDetail(widget.userId ?? "");
        },
        child: controller.userModel.value.data?.isFollow == true
            ? const Text("Takibi Bırak")
            : const Text("Takip Et"),
      ),
    );
  }

  Widget _buildTabBar() {
    return TabBar(
      controller: tabController,
      tabs: const [
        Tab(child: Text("Paylaşımlar")),
      ],
    );
  }

  Widget _buildTabBarView() {
    return Expanded(
      child: TabBarView(
        controller: tabController,
        children: [
          Obx(
            () {
              if (controller.isLoading.value == true) {
                return const Center(child: CircularProgressIndicator());
              } else if (controller.feedModel.value.data == null) {
                return const Center(child: Text("Veri alınamadı"));
              } else {
                return _buildFeedList();
              }
            },
          ),
        ],
      ),
    );
  }

  Widget _buildFeedList() {
    var data = controller.feedModel.value.data;
    return ListView.separated(
      physics: const BouncingScrollPhysics(),
      itemCount: data?.length ?? 0,
      separatorBuilder: (context, index) =>
          const Divider(color: Palette.seperatorGrey),
      itemBuilder: (context, index) {
        return CustomPostCard(data: data?[index]);
        // return _buildFeedItem(data?[index]);
      },
    );
  }

  Widget _buildFeedItem(var itemData) {
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
                  itemData?.user?.profileImageData ??
                      AssetConstants.defaultProfileImage,
                ),
              ),
              getIconForPostType(itemData?.postTypeId),
            ],
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildFeedItemHeader(itemData),
                const SizedBox(height: 5),
                if (itemData?.text != null) ...[
                  Text(
                    itemData?.text ?? "",
                    style: GoogleFonts.cabin(fontSize: 16),
                    textAlign: TextAlign.start,
                  ),
                ],
                const SizedBox(height: 10),
                if (itemData?.additionals == null ||
                    itemData?.additionals?.isEmpty) ...[
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
  }

  Widget _buildFeedItemHeader(dynamic itemData) {
    return Row(
      children: [
        Expanded(
          child: Row(
            children: [
              Flexible(
                flex: 2,
                child: Text(
                  "${itemData?.user?.firstname} ${itemData?.user?.lastname} ",
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
                  "${itemData?.user?.email}",
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
                  "• ${itemData?.createdAt}",
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
        if (itemData?.user?.userId == controller.box.read("uid"))
          IconButton(
            onPressed: () async {
              await controller.removePost(
                  itemData?.postId, itemData?.user?.userId.toString() ?? "");
            },
            icon: const Icon(Icons.remove),
          ),
      ],
    );
  }
}

Widget getIconForPostType(int? postTypeId) {
  switch (postTypeId) {
    case 1:
      return SvgPicture.asset(AssetConstants.iconQuestion);
    case 2:
      return SvgPicture.asset(AssetConstants.iconInfo);
    default:
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
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            child: Text.rich(
              TextSpan(
                text: department,
                style: GoogleFonts.inter(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Palette.loginButtonDarkBlueColor,
                ),
              ),
            ),
          ),
        ),
        // SvgPicture.asset(
        //   AssetConstants.iconForward,
        //   color: Palette.loginButtonBlueColor,
        // ),
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

  final int count;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          count.toString(),
          style: GoogleFonts.inter(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Palette.white,
          ),
        ),
        const SizedBox(height: 5),
        Text(
          title,
          style: GoogleFonts.inter(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: Palette.white,
          ),
        ),
      ],
    );
  }
}
