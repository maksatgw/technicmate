import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:technicmate/constants/asset_constants.dart';
import 'package:technicmate/features/home/controller/home_controller.dart';
import 'package:technicmate/features/post/view/post_add_view.dart';
import 'package:technicmate/theme/theme.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});
  final controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SliderDrawer(
        appBar: null,
        slider: Container(),
        key: controller.sliderDrawerKey,
        child: Obx(() => controller.pages[controller.currentIndex.value]),
      ),
      bottomNavigationBar: Obx(
        () => CupertinoTabBar(
          height: 80,
          currentIndex: controller.currentIndex.value,
          onTap: (index) => controller.changePage(index),
          backgroundColor: Palette.transparent,
          items: [
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                controller.currentIndex.value == 0
                    ? AssetConstants.bottomNavHomeActive
                    : AssetConstants.bottomNavHomePassive,
              ),
            ),
            BottomNavigationBarItem(
              icon: InkWell(
                onTap: () {
                  Get.to(PostAddView());
                },
                child: Container(
                  height: 66,
                  width: 66,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: SvgPicture.asset(
                      AssetConstants.bottomNavBarCenterAdd,
                    ),
                  ),
                ),
              ),
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                controller.currentIndex.value == 2
                    ? AssetConstants.bottomNavSearchActive
                    : AssetConstants.bottomNavSearchPassive,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
