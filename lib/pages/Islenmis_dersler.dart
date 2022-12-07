import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ogrenciden_canli_egitim_uygulamasi/view/islene_ders_card.dart';

import '../view/olusturulan_ders_card.dart';

class IslenmisDersler extends StatefulWidget {
  const IslenmisDersler({super.key});

  @override
  State<IslenmisDersler> createState() => _IslenmisDerslerState();
}

class _IslenmisDerslerState extends State<IslenmisDersler> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("İşlenen Dersler"),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              "assets/images/ogrenciden_logo_png.png",
              height: Get.height * 0.05,
            ),
          )
        ],
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) {
          return const IslenmisDersCArd();
        },
      ),
    );
  }
}
