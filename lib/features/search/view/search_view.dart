import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:technicmate/constants/constants.dart';
import 'package:technicmate/features/search/controller/search_controller.dart';
import 'package:technicmate/features/user/view/user_profile_view.dart';
import 'package:technicmate/theme/palette.dart';

class SearchView extends StatelessWidget {
  SearchView({super.key});
  final controller = Get.put(UserSearchController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: SizedBox(
          height: 40,
          child: TextField(
            controller: controller.searchTextEdit,
            onChanged: (value) async {
              if (value.isNotEmpty) {
                await controller.searchUser(value);
              }
            },
            style: const TextStyle(fontSize: 14),
            decoration: InputDecoration(
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50),
                  borderSide: BorderSide.none),
              filled: true,
              fillColor: Palette.authTextFieldFillColor,
              hintText: "Ara",
              hintStyle: GoogleFonts.inter(fontSize: 14),
              contentPadding: const EdgeInsets.all(10),
            ),
          ),
        ),
      ),
      body: Obx(
        () {
          if (controller.isLoading.isTrue) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (controller.model.value.data == null) {
            return const Center(child: Text("Veri yok"));
          } else if (controller.model.value.data!.isEmpty) {
            return const Center(child: Text("Veri yok"));
          } else {
            return ListView.separated(
              separatorBuilder: (context, index) {
                return const Divider();
              },
              itemCount: controller.model.value.data?.length ?? 0,
              itemBuilder: (context, index) {
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  child: InkWell(
                    onTap: () async {
                      Get.to(
                        () => UserProfileView(
                          userId: controller.model.value.data?[index].userId,
                        ),
                      );
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          radius: 24,
                          backgroundImage: NetworkImage(
                            "${controller.model.value.data?[index].profileImageData}",
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
                                          flex: 1,
                                          child: Text(
                                            "${controller.model.value.data?[index].email} ",
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
                              Row(
                                children: [
                                  Text(
                                    "${controller.model.value.data?[index].firstname} ${controller.model.value.data?[index].lastname}",
                                    style: GoogleFonts.cabin(fontSize: 16),
                                    textAlign: TextAlign.start,
                                  ),
                                  const SizedBox(width: 5),
                                  Flexible(
                                    child: Text(
                                      "Takip Ediyorsun",
                                      overflow: TextOverflow.ellipsis,
                                      style: GoogleFonts.inter(
                                        fontSize: 12,
                                        color: Palette.usernameGrey,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
