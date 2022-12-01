import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:ogrenciden_canli_egitim_uygulamasi/constants/assets_size_constants.dart';
import 'package:ogrenciden_canli_egitim_uygulamasi/constants/sizedbox_constants.dart';
import 'package:ogrenciden_canli_egitim_uygulamasi/constants/string_constants.dart';
import 'package:ogrenciden_canli_egitim_uygulamasi/constants/string_detail_constants.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
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
                StringConstants.instance.introTitleWorld,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: StringDetailConstants.instance.titleSize,
                    fontWeight: StringDetailConstants.instance.titleWeight),
              ),
            ),
            Lottie.asset("assets/gifs/world.zip", height: AssetsConstants.instance.gifHeight),
          ],
        ),
      ),
    );
  }
}
