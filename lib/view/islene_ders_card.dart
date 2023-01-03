import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/color_constants.dart';
import '../constants/sizedbox_constants.dart';
import '../constants/string_detail_constants.dart';

class IslenmisDersCArd extends StatefulWidget {
  const IslenmisDersCArd({super.key});

  @override
  State<IslenmisDersCArd> createState() => _IslenmisDersCArdState();
}
//state management

class _IslenmisDersCArdState extends State<IslenmisDersCArd> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: ColorConstants.instance.hippieGreenLight8x,
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
        child: ListTile(
          title: Row(
            children: [
              SizedBox(
                width: Get.width * 0.65,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Onur Doğan",
                      style: TextStyle(
                        fontWeight: StringDetailConstants.instance.textWeightBold,
                        fontSize: StringDetailConstants.instance.buttonBigSize,
                      ),
                    ),
                    SizedBox(
                      height: SizedboxConstans.instance.spaceSmall,
                    ),
                    Text(
                      "Yazılım Geçerleme ve Sınama",
                      style: TextStyle(
                        fontWeight: StringDetailConstants.instance.textWeightSemiBold,
                        fontSize: StringDetailConstants.instance.textFieldSize,
                      ),
                    ),
                    SizedBox(
                      height: SizedboxConstans.instance.spaceSmall / 2,
                    ),
                    const Text(
                        "Bu ders içeriğinde bir uygulamanın nasıl yapıldığını göstererek uygulamayı baştan tasarlayarak geliştirme ve pazarlama aşamasına kadar olan süreç anlatılır.")
                  ],
                ),
              ),
              Image.asset(
                "assets/images/insan.png",
                fit: BoxFit.cover,
                height: 80,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
