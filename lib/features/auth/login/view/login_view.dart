import 'package:flutter/material.dart';
import 'package:flutter_glow/flutter_glow.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:technicmate/constants/constants.dart';
import 'package:technicmate/features/auth/login/controller/login_controller.dart';

import 'package:technicmate/theme/theme.dart';

class LoginView extends StatelessWidget {
  LoginView({super.key});
  final controller = Get.put(LoginController());
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SvgPicture.asset(
              AssetConstants.technicMateLogoWhite,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Öğrenci Mail Adresi",
                      style: GoogleFonts.inter(
                        fontSize: 16,
                      ),
                      textAlign: TextAlign.start,
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: controller.emailController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Lütfen boş geçmeyin.";
                        }
                        if (!value.isEmail) {
                          return "Lütfen doğru bir email girin.";
                        }
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(6), borderSide: BorderSide.none),
                        filled: true,
                        fillColor: Palette.authTextFieldFillColor,
                        hintText: "Yazmak için tıkla...",
                        hintStyle: GoogleFonts.inter(fontSize: 13),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Obx(
              () {
                if (controller.isLoading.isFalse) {
                  return GlowButton(
                    color: Palette.loginButtonBlueColor,
                    glowColor: Palette.loginButtonBlueColor,
                    borderRadius: BorderRadius.circular(16),
                    width: 110,
                    height: 34,
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        controller.checkEmail();
                      }
                    },
                    child: Text(
                      "Devam et",
                      style: GoogleFonts.inter(fontSize: 14),
                    ),
                  );
                } else {
                  return const CircularProgressIndicator();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
