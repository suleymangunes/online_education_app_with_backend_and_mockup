import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ogrenciden_canli_egitim_uygulamasi/pages/canli_yayin.dart';

import '../constants/color_constants.dart';
import '../constants/sizedbox_constants.dart';
import '../constants/string_detail_constants.dart';

class SelectedCardDesign extends StatelessWidget {
  const SelectedCardDesign({super.key});

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
                      "10.08.2022   17:30 - 18.30",
                      style: TextStyle(
                        fontWeight: StringDetailConstants.instance.titleWeight,
                        fontSize: StringDetailConstants.instance.textFieldSize / 1.1,
                      ),
                    ),
                    SizedBox(
                      height: SizedboxConstans.instance.spaceSmall / 2,
                    ),
                    Row(
                      children: [
                        ElevatedButton(
                          style: ButtonStyle(
                              elevation: MaterialStateProperty.all(3),
                              backgroundColor: MaterialStateProperty.all(ColorConstants.instance.hippieGreen),
                              shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)))),
                          onPressed: (() {
                            Get.to(const CanliYayin());
                          }),
                          child: Padding(
                            padding: const EdgeInsets.all(2),
                            child: Text(
                              "Derse Katıl",
                              style: TextStyle(fontSize: Get.width * 0.04, letterSpacing: 2),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: Get.width * 0.03,
                        ),
                        ElevatedButton(
                          style: ButtonStyle(
                              elevation: MaterialStateProperty.all(3),
                              backgroundColor: MaterialStateProperty.all(ColorConstants.instance.crimson),
                              shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)))),
                          onPressed: (() {}),
                          child: Padding(
                            padding: const EdgeInsets.all(2),
                            child: Text(
                              "İptal Et",
                              style: TextStyle(fontSize: Get.width * 0.04, letterSpacing: 2),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  Image.asset(
                    "assets/images/insan.jpg",
                    fit: BoxFit.cover,
                    height: 100,
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
