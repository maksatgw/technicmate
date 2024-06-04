import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_glow/flutter_glow.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:technicmate/constants/constants.dart';
import 'package:technicmate/features/auth/register/controller/register_controller.dart';
import 'package:technicmate/features/auth/register/view/register_birthdate_view.dart';
import 'package:technicmate/theme/theme.dart';

class RegisterNameView extends StatelessWidget {
  RegisterNameView({super.key});
  final controller = Get.put(RegisterController());
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: SvgPicture.asset(
          AssetConstants.technicMateLogoWhite,
          height: kToolbarHeight / 1.5,
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                CircleAvatar(
                  minRadius: 50,
                  backgroundColor: Palette.white,
                  child: ClipOval(
                    child: Image.network(
                      AssetConstants.defaultProfileImage,
                      width: 150,
                      height: 150,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  "Devam Edelim!",
                  style: GoogleFonts.inter(
                      fontSize: 20, fontWeight: FontWeight.w100),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Ad",
                      style: GoogleFonts.inter(fontSize: 16),
                      textAlign: TextAlign.start,
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: controller.registerNameController,
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z]'))
                      ],
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Lütfen boş geçmeyiniz.";
                        }
                        if (value.length < 2) {
                          return "Lütfen en az iki karakter giriniz.";
                        } else {
                          return null;
                        }
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(6),
                            borderSide: BorderSide.none),
                        filled: true,
                        fillColor: Palette.authTextFieldFillColor,
                        hintText: "Yazmak için tıkla...",
                        hintStyle: GoogleFonts.inter(fontSize: 13),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "Soyad",
                      style: GoogleFonts.inter(fontSize: 16),
                      textAlign: TextAlign.start,
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: controller.registerSurnameController,
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z]'))
                      ],
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Lütfen boş geçmeyiniz.";
                        }
                        if (value.length < 2) {
                          return "Lütfen en az iki karakter giriniz.";
                        } else {
                          return null;
                        }
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(6),
                            borderSide: BorderSide.none),
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
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Wrap(
                  spacing: 10,
                  children: [
                    GlowButton(
                      color: Palette.loginButtonDarkBlueColor,
                      glowColor: Palette.loginButtonDarkBlueColor,
                      borderRadius: BorderRadius.circular(16),
                      width: 110,
                      height: 34,
                      onPressed: () {
                        Get.back();
                      },
                      child: Text(
                        "Geri dön",
                        style: GoogleFonts.inter(fontSize: 14),
                      ),
                    ),
                    GlowButton(
                      color: Palette.loginButtonBlueColor,
                      glowColor: Palette.loginButtonBlueColor,
                      borderRadius: BorderRadius.circular(16),
                      width: 110,
                      height: 34,
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          print(controller.universityId);
                          print(controller.email);
                          print(controller.registerNameController.text);
                          print(controller.registerSurnameController.text);
                          Get.to(() => RegisterBirthdateView());
                        }
                      },
                      child: Text(
                        "Devam Et",
                        style: GoogleFonts.inter(fontSize: 14),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
