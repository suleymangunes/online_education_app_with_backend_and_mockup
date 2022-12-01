import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../constants/assets_size_constants.dart';
import '../constants/sizedbox_constants.dart';
import '../constants/string_constants.dart';
import '../constants/string_detail_constants.dart';

class IntroScreen2 extends StatefulWidget {
  const IntroScreen2({super.key});

  @override
  State<IntroScreen2> createState() => _IntroScreen2State();
}

class _IntroScreen2State extends State<IntroScreen2> {
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
                StringConstants.instance.introTitleEducation,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: StringDetailConstants.instance.titleSize,
                    fontWeight: StringDetailConstants.instance.titleWeight),
              ),
            ),
            Lottie.asset("assets/gifs/education.zip", height: AssetsConstants.instance.gifHeight),
          ],
        ),
      ),
    );
  }
}
