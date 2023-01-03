import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ogrenciden_canli_egitim_uygulamasi/constants/sizedbox_constants.dart';
import 'package:ogrenciden_canli_egitim_uygulamasi/constants/string_detail_constants.dart';
import 'package:ogrenciden_canli_egitim_uygulamasi/pages/enter_lesson_page.dart';
import '../constants/color_constants.dart';

class CardDesign extends StatefulWidget {
  const CardDesign({
    Key? key,
    required this.ogretmenisim,
    required this.dersicerigi,
    required this.dersadi,
    required this.dersid,
    required this.ogretmenid,
  }) : super(key: key);

  final String ogretmenisim;
  final String dersicerigi;
  final String dersadi;
  final String dersid;
  final String ogretmenid;
  @override
  State<CardDesign> createState() => _CardDesignState();
}

class _CardDesignState extends State<CardDesign> {
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: Get.width * 0.58,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.ogretmenisim,
                      style: TextStyle(
                        fontWeight: StringDetailConstants.instance.textWeightBold,
                        fontSize: StringDetailConstants.instance.buttonBigSize,
                      ),
                    ),
                    SizedBox(
                      height: SizedboxConstans.instance.spaceSmall,
                    ),
                    Text(
                      widget.dersadi,
                      style: TextStyle(
                        fontWeight: StringDetailConstants.instance.textWeightSemiBold,
                        fontSize: StringDetailConstants.instance.textFieldSize,
                      ),
                    ),
                    SizedBox(
                      height: SizedboxConstans.instance.spaceSmall / 2,
                    ),
                    Text(widget.dersicerigi)
                  ],
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Column(
                  children: [
                    Image.asset(
                      "assets/images/insan.png",
                      fit: BoxFit.cover,
                      height: 60,
                    ),
                    SizedBox(
                      height: SizedboxConstans.instance.spaceSmall / 2,
                    ),
                    ElevatedButton(
                      style: ButtonStyle(
                          elevation: MaterialStateProperty.all(3),
                          backgroundColor: MaterialStateProperty.all(ColorConstants.instance.hippieGreen),
                          shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)))),
                      onPressed: (() {
                        Get.to(EnterLesson(
                          ogretmenadi: widget.ogretmenisim,
                          dersisim: widget.dersadi,
                          dersicerigi: widget.dersicerigi,
                          dersid: widget.dersid,
                          ogretmenid: widget.ogretmenid,
                        ));
                      }),
                      child: Padding(
                        padding: const EdgeInsets.all(2),
                        child: Text(
                          "Katıl",
                          style: TextStyle(fontSize: Get.width * 0.04, letterSpacing: 0),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
