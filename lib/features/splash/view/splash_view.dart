import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:technicmate/constants/constants.dart';
import 'package:technicmate/features/auth/login/view/login_view.dart';
import 'package:technicmate/features/home/view/home_view.dart';
import 'package:technicmate/theme/palette.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  //Getx ile controller'ı dependency Injection yoluyla ekliyoruz.
  final box = GetStorage();

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2), () {
      if (box.read('bearer') == null) {
        Get.offAll(() => LoginView());
      } else {
        Get.offAll(() => HomeView());
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //Scaffold ile ana yapıyı kuruyoruz.
    return Scaffold(
      //Arkaplan rengini beyaz olarak verdik.
      backgroundColor: Palette.white,
      //Body içinde bir Column widgetı var.
      body: Column(
        //Widget'ın ana yerleşimi ekranın ortası olarak verdik.
        mainAxisAlignment: MainAxisAlignment.center,
        //Widget'ın alt bileşenlerini tanımlıyoruz.
        children: [
          //Diğer bileşenden kalan yeri de kendisine alabilmesi için expanded kullandık
          Expanded(
            //SVG olarak logomuzu kullandık.
            child: SvgPicture.asset(AssetConstants.technicMateLogoWithText),
          ),
          //Clippath widgetı ile dalga efektimizi yapıyoruz.
          ClipPath(
            clipper: WaveClipperTwo(flip: true, reverse: true),
            child: Container(
              //Boyutlar ekrana göre duyarlı olarak ayarlanır.
              height: MediaQuery.of(context).size.height / 4,
              width: MediaQuery.of(context).size.width,
              color: Palette.tmMainBlue,
            ),
          )
        ],
      ),
    );
  }
}
