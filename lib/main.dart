import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:technicmate/core/routes/get_routes.dart';
import 'package:technicmate/features/post/view/post_detail_view.dart';
import 'package:technicmate/features/splash/view/splash_view.dart';
import 'package:technicmate/theme/theme.dart';

void main() async {
  await GetStorage.init();
  return runApp(
    GetMaterialApp(
      darkTheme: AppTheme.theme,
      themeMode: ThemeMode.dark,
      debugShowCheckedModeBanner: false,
      getPages: AppPages.pages,
      home: SplashView(),
    ),
  );
}
