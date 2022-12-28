import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ogrenciden_canli_egitim_uygulamasi/constants/build_color.dart';
import 'package:ogrenciden_canli_egitim_uygulamasi/constants/color_constants.dart';
import 'package:ogrenciden_canli_egitim_uygulamasi/constants/icon_constants.dart';
import 'package:ogrenciden_canli_egitim_uygulamasi/pages/home_page.dart';
import 'package:ogrenciden_canli_egitim_uygulamasi/service/auth_register.dart';
import 'package:ogrenciden_canli_egitim_uygulamasi/service/firebase_options.dart';
import 'package:ogrenciden_canli_egitim_uygulamasi/pages/intro_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MyApp());
}

// ignore: must_be_immutable
class MyApp extends StatelessWidget {
  MyApp({super.key});

  AuthService authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          primarySwatch: buildMaterialColor(ColorConstants.instance.hippieGreen),
          appBarTheme: AppBarTheme(
              titleTextStyle: TextStyle(color: Colors.black, fontSize: Get.width * 0.05, fontWeight: FontWeight.w500),
              elevation: 0,
              backgroundColor: Colors.white,
              iconTheme: IconThemeData(
                  color: ColorConstants.instance.hippieGreen, size: IconConstants.instance.appBarIconSize))),
      home: authService.issignin() == null ? const PageViewDesign() : const HomePage(),
    );
  }
}
