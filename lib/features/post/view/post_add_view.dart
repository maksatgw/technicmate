import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:technicmate/constants/constants.dart';
import 'package:technicmate/features/post/controller/post_controller.dart';
import 'package:technicmate/theme/theme.dart';

class PostAddView extends StatelessWidget {
  PostAddView({super.key});
  final controller = Get.put(PostController());
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Obx(
            () => controller.isLoading.isFalse
                ? Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Palette.chatBlueButtonColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          controller.createPost();
                        }
                      },
                      child: const Icon(
                        Icons.add,
                      ),
                    ),
                  )
                : const CircularProgressIndicator(),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Wrap(
                  spacing: 5,
                  children: [
                    PostAddCustomChip(
                        selectedValue: controller.selectedValue,
                        index: 1,
                        title: "Soru",
                        icon: AssetConstants.iconQuestion),
                    PostAddCustomChip(
                        selectedValue: controller.selectedValue,
                        index: 2,
                        title: "Bilgi",
                        icon: AssetConstants.iconInfo),
                    PostAddCustomChip(
                        selectedValue: controller.selectedValue,
                        index: 3,
                        title: "Hiçbiri",
                        icon: ""),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Lütfen boş geçmeyiniz.";
                    }
                    return null;
                  },
                  controller: controller.postBodyController,
                  style: const TextStyle(fontSize: 16),
                  decoration: InputDecoration(
                    hintText: "Technicmate için bir post paylaş!",
                    hintStyle: const TextStyle(color: Palette.textGrey777),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                    fillColor: Palette.chatTextFieldBg,
                  ),
                  maxLines: null,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PostAddCustomChip extends StatelessWidget {
  const PostAddCustomChip({
    super.key,
    required this.selectedValue,
    required this.index,
    required this.title,
    required this.icon,
  });

  final RxInt selectedValue;
  final int index;
  final String title;
  final String icon;
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => FilterChip(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        padding: const EdgeInsets.all(5),
        backgroundColor:
            selectedValue.value == index ? Colors.white : Colors.grey,
        label: Wrap(
          spacing: 5,
          children: [
            Text(
              title,
              style: const TextStyle(color: Colors.black),
            ),
            if (icon != "") ...{
              SvgPicture.asset(icon),
            }
          ],
        ),
        onSelected: (value) {
          selectedValue.value = index;
          print(selectedValue.value);
        },
      ),
    );
  }
}
