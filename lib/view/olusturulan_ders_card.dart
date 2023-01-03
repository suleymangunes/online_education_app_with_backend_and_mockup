import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ogrenciden_canli_egitim_uygulamasi/pages/home_page.dart';
import 'package:ogrenciden_canli_egitim_uygulamasi/service/auth_register.dart';

import '../constants/color_constants.dart';
import '../constants/sizedbox_constants.dart';
import '../constants/string_detail_constants.dart';

class OlusturulanDersCard extends StatefulWidget {
  const OlusturulanDersCard({
    super.key,
    required this.dersicerigi,
    required this.dersadi,
    required this.dersid,
    required this.ogretmenadi,
    required this.ogretmenid,
  });

  final String dersicerigi;
  final String dersadi;
  final String dersid;
  final String ogretmenadi;
  final String ogretmenid;
  @override
  State<OlusturulanDersCard> createState() => _OlusturulanDersCardState();
}

class _OlusturulanDersCardState extends State<OlusturulanDersCard> {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  AuthService authService = AuthService();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    setState(() {});
  }

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
                      widget.ogretmenadi,
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
              Column(
                children: [
                  Image.asset(
                    "assets/images/insan.png",
                    fit: BoxFit.cover,
                    height: 80,
                  ),
                  SizedBox(
                    height: SizedboxConstans.instance.spaceSmall / 2,
                  ),
                  ElevatedButton(
                    style: ButtonStyle(
                        elevation: MaterialStateProperty.all(3),
                        backgroundColor: MaterialStateProperty.all(ColorConstants.instance.crimson),
                        shape:
                            MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)))),
                    onPressed: (() {
                      firestore.collection('dersler').doc(widget.dersid).delete().then((value) {
                        return showDialog(
                          barrierDismissible: false,
                          context: context,
                          builder: (context) {
                            return Dialog(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    const Text(
                                      'Ders Kaldırıldı!',
                                      style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
                                    ),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    const Text(
                                      'Dersi kaldırma işlemi başarılı.',
                                      style: TextStyle(fontSize: 18),
                                    ),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    ElevatedButton(
                                      style: ButtonStyle(
                                          elevation: MaterialStateProperty.all(3),
                                          backgroundColor:
                                              MaterialStateProperty.all(ColorConstants.instance.hippieGreen),
                                          shape: MaterialStateProperty.all(
                                              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)))),
                                      onPressed: (() {
                                        setState(() {});
                                        Get.to(const HomePage());
                                      }),
                                      child: const Padding(
                                        padding: EdgeInsets.all(2),
                                        child: Text(
                                          'Tamam',
                                          style: TextStyle(fontSize: 15, letterSpacing: 1),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      });
                    }),
                    child: Padding(
                      padding: const EdgeInsets.all(2),
                      child: Text(
                        "Kaldır",
                        style: TextStyle(fontSize: Get.width * 0.030, letterSpacing: 2),
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
