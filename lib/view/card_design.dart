import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ogrenciden_canli_egitim_uygulamasi/constants/sizedbox_constants.dart';
import 'package:ogrenciden_canli_egitim_uygulamasi/constants/string_detail_constants.dart';
import 'package:ogrenciden_canli_egitim_uygulamasi/pages/enter_lesson_page.dart';
import '../constants/color_constants.dart';

class CardDesign extends StatelessWidget {
  const CardDesign({
    Key? key,
  }) : super(key: key);

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
              Column(
                children: [
                  Image.asset(
                    "assets/images/insan.jpg",
                    fit: BoxFit.cover,
                    height: 100,
                  ),
                  SizedBox(
                    height: SizedboxConstans.instance.spaceSmall / 2,
                  ),
                  ElevatedButton(
                    style: ButtonStyle(
                        elevation: MaterialStateProperty.all(3),
                        backgroundColor: MaterialStateProperty.all(ColorConstants.instance.hippieGreen),
                        shape:
                            MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)))),
                    onPressed: (() {
                      Get.to(const EnterLesson());
                    }),
                    child: Padding(
                      padding: const EdgeInsets.all(2),
                      child: Text(
                        "Katıl",
                        style: TextStyle(fontSize: Get.width * 0.04, letterSpacing: 2),
                      ),
                    ),
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
