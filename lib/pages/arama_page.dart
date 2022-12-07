import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AramaPage extends StatefulWidget {
  const AramaPage({super.key});

  @override
  State<AramaPage> createState() => _AramaPageState();
}

class _AramaPageState extends State<AramaPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: TextField(
          style: TextStyle(
            fontSize: Get.width * 0.04,
          ),
          decoration: InputDecoration(
            hintText: "Bir Şeyler Yaz...",
            hintStyle: TextStyle(
              fontSize: Get.width * 0.04,
            ),
          ),
        ),
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
    );
  }
}
