import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ogrenciden_canli_egitim_uygulamasi/alerts/alert_error.dart';
import 'package:ogrenciden_canli_egitim_uygulamasi/constants/color_constants.dart';
import 'package:ogrenciden_canli_egitim_uygulamasi/constants/sizedbox_constants.dart';
import 'package:ogrenciden_canli_egitim_uygulamasi/pages/olusturdugum_derslerim.dart';
import 'package:ogrenciden_canli_egitim_uygulamasi/pages/sign_in.dart';
import 'package:ogrenciden_canli_egitim_uygulamasi/service/auth_register.dart';

import '../constants/string_detail_constants.dart';

class Profil extends StatefulWidget {
  const Profil({super.key});

  @override
  State<Profil> createState() => _ProfilState();
}

class _ProfilState extends State<Profil> {
  String? isim;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  AuthService authService = AuthService();
  List listem = [];
  List listem2 = [];

  Future<DocumentSnapshot<Map<String, dynamic>>> nameAl() async {
    return await firestore.collection('Person').doc(authService.infouser()).get();
  }

  olusturduklariGetir() async {
    return firestore.collection('dersler').get();
  }

  List olusturduklarim = [];

  @override
  void initState() {
    super.initState();
    nameAl().then((value) {
      print('******************');
      print(value.data()?['userName']);
      setState(() {
        isim = value.data()?['userName'];
      });
    });
    olusturduklariGetir().then((value) {
      print('###############');
      print(value.docs);
    });
  }

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
      body: FutureBuilder(
        future: olusturduklariGetir(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasData) {
            listem = [];
            listem2 = [];
            for (var element in snapshot.data.docs) {
              // listem.add(element.data()['ogretmenid']);
              if (authService.infouser() == element.data()['ogretmenid']) {
                print('evet var');
                print(element.data());
                listem.add(element.data());
              }
            }
            // print('******************');
            // print(snapshot.data.docs[0].data());
            // print(listem);
            // print(authService.infouser());
            print(listem);
          }
          return FutureBuilder(
            // future: ,
            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
              return Column(
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
                                backgroundImage: const AssetImage("assets/images/insan.png"),
                              ),
                            ),
                            SizedBox(
                              height: SizedboxConstans.instance.spaceSmall * 2,
                            ),
                            Text(
                              isim ?? '',
                              style: TextStyle(
                                fontWeight: StringDetailConstants.instance.textWeightBold,
                                fontSize: StringDetailConstants.instance.buttonBigSize / 1.1,
                              ),
                            ),
                            SizedBox(
                              height: SizedboxConstans.instance.spaceSmall,
                            ),
                            Text(
                              "Fırat Üniversitesi - Mühendislik Fakültesi",
                              style: TextStyle(
                                fontWeight: StringDetailConstants.instance.titleWeight,
                                fontSize: StringDetailConstants.instance.buttonBigSize / 1.4,
                              ),
                            ),
                            SizedBox(
                              height: SizedboxConstans.instance.spaceSmall / 2,
                            ),
                            Text(
                              "Yazılım Mühendisliği / 4. Sınıf",
                              style: TextStyle(
                                fontWeight: StringDetailConstants.instance.titleWeight,
                                fontSize: StringDetailConstants.instance.buttonBigSize / 1.4,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: Get.height * 0.09,
                    width: Get.width,
                    child: Card(
                      elevation: 3,
                      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      color: ColorConstants.instance.hippieGreenLight4x,
                      child: InkWell(
                        onTap: (() {
                          Get.to(OlusturdugumDerslerim(
                            liste: listem,
                          ));
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
                                  fontSize: StringDetailConstants.instance.buttonBigSize / 1.2,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  // SizedBox(
                  //   height: Get.height * 0.09,
                  //   width: Get.width,
                  //   child: Card(
                  //     elevation: 3,
                  //     margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  //     color: ColorConstants.instance.hippieGreenLight4x,
                  //     child: InkWell(
                  //       onTap: (() {
                  //         Get.to(const IslenmisDersler());
                  //       }),
                  //       child: Padding(
                  //         padding: const EdgeInsets.only(top: 15, right: 30, left: 30, bottom: 15),
                  //         child: Column(
                  //           crossAxisAlignment: CrossAxisAlignment.start,
                  //           children: [
                  //             Text(
                  //               "İşlenmiş Dersler",
                  //               style: TextStyle(
                  //                 fontWeight: StringDetailConstants.instance.titleWeight,
                  //                 fontSize: StringDetailConstants.instance.buttonBigSize / 1.2,
                  //               ),
                  //             ),
                  //           ],
                  //         ),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  // SizedBox(
                  //   height: Get.height * 0.09,
                  //   width: Get.width,
                  //   child: Card(
                  //     elevation: 3,
                  //     margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  //     color: ColorConstants.instance.hippieGreenLight4x,
                  //     child: InkWell(
                  //       onTap: (() {
                  //         Get.to(const IptalEdilenDersler());
                  //       }),
                  //       child: Padding(
                  //         padding: const EdgeInsets.only(top: 15, right: 30, left: 30, bottom: 15),
                  //         child: Column(
                  //           crossAxisAlignment: CrossAxisAlignment.start,
                  //           children: [
                  //             Text(
                  //               "İptal Edilen Dersler",
                  //               style: TextStyle(
                  //                 fontWeight: StringDetailConstants.instance.titleWeight,
                  //                 fontSize: StringDetailConstants.instance.buttonBigSize / 1.2,
                  //               ),
                  //             ),
                  //           ],
                  //         ),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  SizedBox(
                    height: Get.height * 0.09,
                    width: Get.width,
                    child: Card(
                      elevation: 3,
                      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      color: ColorConstants.instance.hippieGreenLight4x,
                      child: InkWell(
                        onTap: (() {
                          authService.signOut().then((value) {
                            Get.offAll(const SignIn());
                          }).onError((error, stackTrace) {
                            return showDialog(
                              context: context,
                              builder: (context) {
                                return ErrorMessage(message: error);
                              },
                            );
                          });
                        }),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 15, right: 30, left: 30, bottom: 15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Çıkış Yap",
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
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
