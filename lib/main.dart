import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:technicmate/core/routes/get_routes.dart';
import 'package:technicmate/features/auth/login/view/login_view.dart';
import 'package:technicmate/features/auth/register/view/register_birthdate_view.dart';
import 'package:technicmate/features/auth/register/view/register_faculty_view.dart';
import 'package:technicmate/features/auth/register/view/register_gender_view.dart';
import 'package:technicmate/features/auth/register/view/register_name_view.dart';
import 'package:technicmate/features/auth/register/view/register_password_view.dart';
import 'package:technicmate/features/splash/view/splash_view.dart';
import 'package:technicmate/theme/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
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
