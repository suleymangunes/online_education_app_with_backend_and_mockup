import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ogrenciden_canli_egitim_uygulamasi/view/olusturulan_ders_card.dart';

class OlusturdugumDerslerim extends StatefulWidget {
  const OlusturdugumDerslerim({super.key});

  @override
  State<OlusturdugumDerslerim> createState() => _OlusturdugumDerslerimState();
}

class _OlusturdugumDerslerimState extends State<OlusturdugumDerslerim> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Oluşturduğum Dersler"),
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
          return const OlusturulanDersCard();
        },
      ),
    );
  }
}
