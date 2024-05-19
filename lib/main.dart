import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:technicmate/theme/theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  return runApp(
    GetMaterialApp(
      darkTheme: AppTheme.theme,
      themeMode: ThemeMode.dark,
      debugShowCheckedModeBanner: false,
      home: const Scaffold(),
    ),
  );
}
