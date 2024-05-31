import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:technicmate/common/models/models.dart';
import 'package:technicmate/constants/constants.dart';
import 'package:technicmate/features/feed/controller/feed_controller.dart';
import 'package:technicmate/theme/theme.dart';

class CustomPostCard extends StatelessWidget {
  const CustomPostCard({
    super.key,
    required this.data,
  });

  final PostModel? data;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomPostCardProfileImage(data: data),
          const SizedBox(width: 10), // Boşluk ekledim
          CustomPostCardBody(data: data),
        ],
      ),
    );
  }
}

class CustomPostCardBody extends StatelessWidget {
  const CustomPostCardBody({
    super.key,
    required this.data,
  });

  final PostModel? data;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomPostCardBodyHeader(data: data),
          Text(
            "${data?.user?.email}",
            // "Fenerbahce",
            overflow: TextOverflow.ellipsis,
            style: GoogleFonts.inter(
              fontSize: 12,
              color: Palette.usernameGrey,
            ),
          ),
          const SizedBox(height: 5),
          if (data?.text != null) ...[
            Text(
              data!.text.toString(),
              style: GoogleFonts.cabin(fontSize: 16),
              textAlign: TextAlign.start,
            ),
          ],
          const SizedBox(height: 10),
          if (data?.additionals != null) ...[
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
    );
  }
}

class CustomPostCardBodyHeader extends StatelessWidget {
  CustomPostCardBodyHeader({
    super.key,
    required this.data,
  });

  final PostModel? data;
  final box = GetStorage();
  final controller = Get.put(FeedController());

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Row(
            children: [
              Flexible(
                flex: 2,
                child: Text(
                  "${data?.user?.firstname} ${data?.user?.lastname} ",
                  style: GoogleFonts.inter(
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const SizedBox(width: 5),
              Flexible(
                child: Text(
                  "• ${data?.createdAt}",
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

        PopupMenuButton<String>(
          onSelected: (String result) {
            print('Selected: $result');
          },
          itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
            if (data?.user?.userId == box.read("uid")) ...[
              PopupMenuItem<String>(
                onTap: () async {
                  await controller.removePost(data?.postId);
                },
                child: const Text('Kaldır'),
              ),
            ] else ...[
              PopupMenuItem<String>(
                onTap: () {
                  print(data?.postId);
                },
                child: const Text('Şikayet et'),
              ),
            ]
          ],
          child: SvgPicture.asset(AssetConstants.threeDotsOption),
        ),
        // InkWell(
        //   onTap: () {},
        //   child: SvgPicture.asset(AssetConstants.threeDotsOption),
        // ),
        // data?.user?.userId == box.read("uid")
        //     ? IconButton(
        //         onPressed: () async {
        //           // await data.removePost(
        //           //     controller.feedPostModel.value
        //           //         .data?[index].postId);
        //           showMenu(
        //             context: context,
        //             position: RelativeRect.fromDirectional(
        //                 textDirection: TextDirection.ltr,
        //                 start: 1,
        //                 top: 0,
        //                 end: 0,
        //                 bottom: 0),
        //             items: [
        //               const PopupMenuItem(
        //                 child: Row(
        //                   children: [
        //                     Text("data"),
        //                   ],
        //                 ),
        //               ),
        //             ],
        //           );
        //         },
        //         icon: const Icon(Icons.remove),
        //       )
        //     : const SizedBox(),
      ],
    );
  }
}

class CustomPostCardProfileImage extends StatelessWidget {
  const CustomPostCardProfileImage({
    super.key,
    required this.data,
  });

  final PostModel? data;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      // onTap: () async {
      //   UserProfileController controller2 =
      //       Get.put(UserProfileController());
      //   String selectedUserId = controller
      //       .feedPostModel.value.data![index].user!.userId
      //       .toString();
      //   controller2.userId = selectedUserId;
      //   await controller2.fetchPosts(selectedUserId);
      //   await controller2.fetchUserDetail(selectedUserId);
      //   Get.to(UserProfileView());
      // },
      child: Stack(
        children: [
          CircleAvatar(
            radius: 24,
            backgroundImage: NetworkImage(
              data?.user?.profileImageData ??
                  AssetConstants.defaultProfileImage,
            ),
          ),
          getIconForPostType(data?.postTypeId),
        ],
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
