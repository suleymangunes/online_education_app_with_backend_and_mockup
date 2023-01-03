import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/color_constants.dart';
import '../constants/sizedbox_constants.dart';
import '../constants/string_detail_constants.dart';

class CancelCard extends StatefulWidget {
  const CancelCard({super.key});

  @override
  State<CancelCard> createState() => _CancelCardState();
}

class _CancelCardState extends State<CancelCard> {
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
                      height: SizedboxConstans.instance.spaceSmall / 1.5,
                    ),
                    Text(
                      "Yazılım Geçerleme ve Sınama",
                      style: TextStyle(
                        fontWeight: StringDetailConstants.instance.textWeightSemiBold,
                        fontSize: StringDetailConstants.instance.textFieldSize,
                      ),
                    ),
                    SizedBox(
                      height: SizedboxConstans.instance.spaceSmall / 5,
                    ),
                    Text(
                      "10.08.2022 17:30",
                      style: TextStyle(
                        fontWeight: StringDetailConstants.instance.titleWeight,
                        fontSize: StringDetailConstants.instance.textFieldSize / 1.1,
                      ),
                    ),
                    SizedBox(
                      height: SizedboxConstans.instance.spaceSmall / 2,
                    ),
                    Container(
                      decoration:
                          BoxDecoration(color: ColorConstants.instance.crimson, borderRadius: BorderRadius.circular(5)),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Text(
                          "Ders İptal Edildi",
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: Get.width * 0.04,
                              letterSpacing: 2,
                              color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  Image.asset(
                    "assets/images/insan.png",
                    fit: BoxFit.cover,
                    height: 80,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
