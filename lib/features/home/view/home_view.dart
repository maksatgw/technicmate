import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:technicmate/constants/asset_constants.dart';
import 'package:technicmate/features/home/controller/home_controller.dart';
import 'package:technicmate/theme/theme.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});
  final controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
      key: controller.scaffoldKey,
      body: Obx(() => controller.pages[controller.currentIndex.value]),
      bottomNavigationBar: Obx(
        () => CupertinoTabBar(
          currentIndex: controller.currentIndex.value,
          onTap: (index) => controller.changePage(index),
          backgroundColor: Palette.transparent,
          items: [
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                controller.currentIndex.value == 0 ? AssetConstants.bottomNavHomeActive : AssetConstants.bottomNavHomePassive,
              ),
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                controller.currentIndex.value == 1 ? AssetConstants.bottomNavSearchActive : AssetConstants.bottomNavSearchPassive,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
