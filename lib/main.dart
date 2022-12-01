import 'package:flutter/material.dart';
import 'package:ogrenciden_canli_egitim_uygulamasi/constants/build_color.dart';
import 'package:ogrenciden_canli_egitim_uygulamasi/constants/color_constants.dart';
import 'package:ogrenciden_canli_egitim_uygulamasi/pages/intro_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Material App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            scaffoldBackgroundColor: Colors.white,
            primarySwatch: buildMaterialColor(ColorConstants.instance.hippieGreen)),
        home: PageViewDesign());
  }
}
