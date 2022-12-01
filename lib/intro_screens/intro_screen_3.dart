import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:ogrenciden_canli_egitim_uygulamasi/constants/color_constants.dart';

import '../constants/assets_size_constants.dart';
import '../constants/sizedbox_constants.dart';
import '../constants/string_constants.dart';
import '../constants/string_detail_constants.dart';

class IntroScreen3 extends StatefulWidget {
  const IntroScreen3({super.key});

  @override
  State<IntroScreen3> createState() => _IntroScreen3State();
}

class _IntroScreen3State extends State<IntroScreen3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: SizedboxConstans.instance.spaceNormal,
            ),
            Padding(
              padding: StringDetailConstants.instance.titlePadding,
              child: Text(
                StringConstants.instance.introTitleStart,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: StringDetailConstants.instance.titleSize,
                    fontWeight: StringDetailConstants.instance.titleWeight),
              ),
            ),
            Lottie.asset("assets/gifs/start.zip", height: AssetsConstants.instance.gifHeight),
            Spacer(),
            SizedBox(
              height: Get.height * 0.05,
              width: Get.width * 0.5,
              child: Hero(
                tag: "basla",
                child: ElevatedButton(
                  style: ButtonStyle(
                      elevation: MaterialStateProperty.all(5),
                      backgroundColor: MaterialStateProperty.all(ColorConstants.instance.hippieGreen),
                      shape:
                          MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)))),
                  onPressed: (() {}),
                  child: Text(
                    "BAŞLA",
                    style: TextStyle(fontSize: Get.width * 0.06, letterSpacing: 3),
                  ),
                ),
              ),
            ),
            SizedBox(height: 70)
          ],
        ),
      ),
    );
  }
}
