import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:technicmate/features/feed/view/feed_view.dart';
import 'package:technicmate/features/search/view/search_view.dart';
import 'package:technicmate/theme/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  return runApp(
    GetMaterialApp(
      darkTheme: AppTheme.theme,
      themeMode: ThemeMode.dark,
      debugShowCheckedModeBanner: false,
      home: SearchView(),
    ),
  );
}
