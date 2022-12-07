import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ogrenciden_canli_egitim_uygulamasi/constants/color_constants.dart';

import '../constants/string_detail_constants.dart';

class CanliYayin extends StatefulWidget {
  const CanliYayin({super.key});

  @override
  State<CanliYayin> createState() => _CanliYayinState();
}

class _CanliYayinState extends State<CanliYayin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Canlı Ders"),
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
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: Get.width * 0.05,
          vertical: Get.width * 0.1,
        ),
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  color: ColorConstants.instance.hippieGreenLight4x,
                  height: Get.width * 9 / 18,
                  width: Get.width,
                  child: Image.asset("assets/images/live2.jpg"),
                ),
                Positioned(
                  bottom: Get.width * 0.01,
                  right: Get.width * 0.02,
                  child: IconButton(
                    icon: Icon(
                      Icons.fit_screen_rounded,
                      size: Get.width * 0.07,
                    ),
                    onPressed: () {},
                  ),
                )
              ],
            ),
            SizedBox(
              height: Get.width * 0.01,
            ),
            Text(
              "Onur Doğan",
              style: TextStyle(
                fontWeight: StringDetailConstants.instance.titleWeight,
                fontSize: StringDetailConstants.instance.textFieldSize,
              ),
            ),
            SizedBox(
              height: Get.width * 0.1,
            ),
            Stack(
              children: [
                Container(
                  color: ColorConstants.instance.hippieGreenLight4x,
                  height: Get.width * 9 / 18,
                  width: Get.width,
                  child: Image.asset("assets/images/live1.jpg"),
                ),
                Positioned(
                  bottom: Get.width * 0.01,
                  right: Get.width * 0.02,
                  child: IconButton(
                    icon: Icon(
                      Icons.fit_screen_rounded,
                      size: Get.width * 0.07,
                    ),
                    onPressed: () {},
                  ),
                )
              ],
            ),
            SizedBox(
              height: Get.width * 0.01,
            ),
            Text(
              "Emily Clarke",
              style: TextStyle(
                fontWeight: StringDetailConstants.instance.titleWeight,
                fontSize: StringDetailConstants.instance.textFieldSize,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
