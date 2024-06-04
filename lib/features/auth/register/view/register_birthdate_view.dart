import 'package:flutter/material.dart';
import 'package:flutter_glow/flutter_glow.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:technicmate/constants/constants.dart';
import 'package:technicmate/features/auth/register/controller/register_controller.dart';
import 'package:technicmate/features/auth/register/view/register_gender_view.dart';
import 'package:technicmate/theme/theme.dart';

class RegisterBirthdateView extends StatelessWidget {
  RegisterBirthdateView({super.key});
  final controller = Get.put(RegisterController());

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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Doğum Tarihi",
                      style: GoogleFonts.inter(fontSize: 16),
                      textAlign: TextAlign.start,
                    ),
                    const SizedBox(height: 10),
                    Obx(
                      () => TextFormField(
                        readOnly: true,
                        onTap: () => controller.pickDate(context),
                        controller: TextEditingController(
                            text: controller.selectedDate.value
                                .toLocal()
                                .toString()
                                .split(' ')[0]),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(6),
                            borderSide: BorderSide.none,
                          ),
                          fillColor: Palette.authTextFieldFillColor,
                          filled: true,
                          hintText: "Yazmak için tıkla...",
                          hintStyle: GoogleFonts.inter(fontSize: 13),
                        ),
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
                        print(controller.universityId);
                        print(controller.registerNameController.text);
                        print(controller.registerSurnameController.text);
                        print(controller.selectedDate.value);
                        Get.to(() => RegisterGenderView());
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
