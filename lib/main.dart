import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ogrenciden_canli_egitim_uygulamasi/constants/build_color.dart';
import 'package:ogrenciden_canli_egitim_uygulamasi/constants/color_constants.dart';
import 'package:ogrenciden_canli_egitim_uygulamasi/constants/icon_constants.dart';
import 'package:ogrenciden_canli_egitim_uygulamasi/pages/intro_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
        home: const PageViewDesign());
  }
}
