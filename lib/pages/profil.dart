import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ogrenciden_canli_egitim_uygulamasi/constants/color_constants.dart';
import 'package:ogrenciden_canli_egitim_uygulamasi/constants/sizedbox_constants.dart';
import 'package:ogrenciden_canli_egitim_uygulamasi/pages/Islenmis_dersler.dart';
import 'package:ogrenciden_canli_egitim_uygulamasi/pages/iptal_edilen_dersler.dart';
import 'package:ogrenciden_canli_egitim_uygulamasi/pages/olusturdugum_derslerim.dart';

import '../constants/string_detail_constants.dart';

class Profil extends StatefulWidget {
  const Profil({super.key});

  @override
  State<Profil> createState() => _ProfilState();
}

class _ProfilState extends State<Profil> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
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
      body: Column(
        children: [
          SizedBox(
            height: Get.height * 0.41,
            child: Card(
              elevation: 3,
              margin: const EdgeInsets.all(20),
              color: ColorConstants.instance.hippieGreenLight8x,
              child: Padding(
                padding: const EdgeInsets.only(top: 30, right: 30, left: 30, bottom: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: CircleAvatar(
                        radius: Get.width / 6,
                        backgroundImage: const AssetImage("assets/images/insan.jpg"),
                      ),
                    ),
                    SizedBox(
                      height: SizedboxConstans.instance.spaceSmall * 2,
                    ),
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
                      "Fırat Üniversitesi - Mühendislik Fakültesi",
                      style: TextStyle(
                        fontWeight: StringDetailConstants.instance.titleWeight,
                        fontSize: StringDetailConstants.instance.buttonBigSize / 1.2,
                      ),
                    ),
                    SizedBox(
                      height: SizedboxConstans.instance.spaceSmall / 2,
                    ),
                    Text(
                      "Yazılım Mühendisliği / 4. Sınıf",
                      style: TextStyle(
                        fontWeight: StringDetailConstants.instance.titleWeight,
                        fontSize: StringDetailConstants.instance.buttonBigSize / 1.2,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: Get.height * 0.08,
            width: Get.width,
            child: Card(
              elevation: 3,
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              color: ColorConstants.instance.hippieGreenLight4x,
              child: InkWell(
                onTap: (() {
                  Get.to(const OlusturdugumDerslerim());
                }),
                child: Padding(
                  padding: const EdgeInsets.only(top: 15, right: 30, left: 30, bottom: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Oluşturduğum Derslerim",
                        style: TextStyle(
                          fontWeight: StringDetailConstants.instance.titleWeight,
                          fontSize: StringDetailConstants.instance.buttonBigSize,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: Get.height * 0.08,
            width: Get.width,
            child: Card(
              elevation: 3,
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              color: ColorConstants.instance.hippieGreenLight4x,
              child: InkWell(
                onTap: (() {
                  Get.to(const IslenmisDersler());
                }),
                child: Padding(
                  padding: const EdgeInsets.only(top: 15, right: 30, left: 30, bottom: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "İşlenmiş Dersler",
                        style: TextStyle(
                          fontWeight: StringDetailConstants.instance.titleWeight,
                          fontSize: StringDetailConstants.instance.buttonBigSize,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: Get.height * 0.08,
            width: Get.width,
            child: Card(
              elevation: 3,
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              color: ColorConstants.instance.hippieGreenLight4x,
              child: InkWell(
                onTap: (() {
                  Get.to(const IptalEdilenDersler());
                }),
                child: Padding(
                  padding: const EdgeInsets.only(top: 15, right: 30, left: 30, bottom: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "İptal Edilen Dersler",
                        style: TextStyle(
                          fontWeight: StringDetailConstants.instance.titleWeight,
                          fontSize: StringDetailConstants.instance.buttonBigSize,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
