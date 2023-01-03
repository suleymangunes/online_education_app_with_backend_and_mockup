import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ogrenciden_canli_egitim_uygulamasi/view/olusturulan_ders_card.dart';

class OlusturdugumDerslerim extends StatefulWidget {
  const OlusturdugumDerslerim({super.key, required this.liste});

  final List liste;
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
        physics: const BouncingScrollPhysics(),
        itemCount: widget.liste.length,
        // itemCount: 0,

        itemBuilder: (BuildContext context, int index) {
          return OlusturulanDersCard(
            dersadi: widget.liste[index]['dersadi'],
            dersicerigi: widget.liste[index]['dersicerigi'],
            dersid: widget.liste[index]['dersid'],
            ogretmenadi: widget.liste[index]['ogretmenisim'],
            ogretmenid: widget.liste[index]['ogretmenid'],
          );
        },
      ),
    );
  }
}
