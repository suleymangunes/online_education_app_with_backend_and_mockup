import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ogrenciden_canli_egitim_uygulamasi/view/cancel_card.dart';

class IptalEdilenDersler extends StatefulWidget {
  const IptalEdilenDersler({super.key});

  @override
  State<IptalEdilenDersler> createState() => _IptalEdilenDerslerState();
}

class _IptalEdilenDerslerState extends State<IptalEdilenDersler> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("İptal Edilen Dersler"),
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
        // itemCount: 0,
        itemBuilder: (BuildContext context, int index) {
          return const CancelCard();
        },
      ),
    );
  }
}
