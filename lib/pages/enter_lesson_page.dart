import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ogrenciden_canli_egitim_uygulamasi/pages/home_page.dart';
import 'package:ogrenciden_canli_egitim_uygulamasi/service/auth_register.dart';
import 'package:ogrenciden_canli_egitim_uygulamasi/view/back_button.dart';

import '../constants/color_constants.dart';
import '../constants/sizedbox_constants.dart';
import '../constants/string_detail_constants.dart';

class EnterLesson extends StatefulWidget {
  const EnterLesson({
    super.key,
    required this.ogretmenadi,
    required this.dersisim,
    required this.dersicerigi,
    required this.dersid,
    required this.ogretmenid,
  });

  final String ogretmenadi;
  final String dersisim;
  final String dersicerigi;
  final String dersid;
  final String ogretmenid;

  @override
  State<EnterLesson> createState() => _EnterLessonState();
}

class _EnterLessonState extends State<EnterLesson> {
  String? ogretmenid;
  AuthService authService = AuthService();
  var alinandersler;

  Future<QuerySnapshot<Map<String, dynamic>>> derslerilistele() async {
    return await _firestore.collection('Person').doc(ogretmenid).collection('alinacakdersler').get();
  }

  List listem = [];
  bool katildimi = false;

  @override
  void initState() {
    ogretmenid = authService.infouser();
    derslerilistele().then((value) {
      alinandersler = value.docs;
      print(alinandersler);
      for (var element in alinandersler) {
        listem.add(element.data()['ders']);
        print(element.data()['ders']);
        print('/**************');
      }
    });
    // listeyeekle();
    setState(() {
      listem.contains(widget.dersid);
    });
    super.initState();
    print('------------------------');
    print(ogretmenid);
    print('------------------------');
  }

  // void listeyeekle() {
  //   for (var element in alinandersler.docs) {
  //     listem.add(element.data()['ders']);
  //   }
  // }

  TimeOfDay _time = const TimeOfDay(hour: 7, minute: 15);

  void _selectTime() async {
    final TimeOfDay? newTime = await showTimePicker(
      context: context,
      initialTime: _time,
    );
    if (newTime != null) {
      setState(() {
        _time = newTime;
      });
    }
  }

  DateTime _date = DateTime(2020, 11, 17);

  void _selectDate() async {
    final DateTime? newDate = await showDatePicker(
      context: context,
      initialDate: _date,
      firstDate: DateTime(2017, 1),
      lastDate: DateTime(2022, 7),
      helpText: 'Select a date',
    );
    if (newDate != null) {
      setState(() {
        _date = newDate;
      });
    }
  }

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  void anasayfadon() {
    Get.to(const HomePage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
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
        body: Card(
          color: ColorConstants.instance.hippieGreenLight8x,
          elevation: 3,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 50),
            child: ListTile(
              title: Column(
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: Get.width * 0.55,
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
                              widget.dersisim,
                              style: TextStyle(
                                fontWeight: StringDetailConstants.instance.textWeightSemiBold,
                                fontSize: StringDetailConstants.instance.textFieldSize,
                              ),
                            ),
                            SizedBox(
                              height: SizedboxConstans.instance.spaceSmall / 2,
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
                          SizedBox(
                            height: SizedboxConstans.instance.spaceSmall / 2,
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: SizedboxConstans.instance.spaceSmall,
                  ),
                  Text(widget.dersicerigi),
                  SizedBox(
                    height: SizedboxConstans.instance.spaceSmall / 2,
                  ),
                  Row(
                    children: [
                      TextButton(
                          onPressed: _selectTime,
                          child: Text(
                            'Saati Seç: ${_time.format(context)}',
                            style: TextStyle(fontSize: StringDetailConstants.instance.textFieldSize),
                          )),
                    ],
                  ),
                  Row(
                    children: [
                      TextButton(
                          onPressed: _selectDate,
                          child: Text(
                            'Tarihi Seç: ${_date.day}.${_date.month}.${_date.year}',
                            style: TextStyle(fontSize: StringDetailConstants.instance.textFieldSize),
                          )),
                    ],
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
                    onPressed: katildimi
                        ? null
                        : (() {
                            if (ogretmenid == widget.ogretmenid) {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return Dialog(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          const Text(
                                            'Uyarı!!',
                                            style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
                                          ),
                                          const SizedBox(
                                            height: 15,
                                          ),
                                          const Text(
                                            'Kendi dersine katılamazsın.',
                                            style: TextStyle(fontSize: 18),
                                          ),
                                          const SizedBox(
                                            height: 15,
                                          ),
                                          BackButtonView(
                                            title: 'Tamam',
                                            fonk: () {
                                              Get.back();
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              );
                            } else if (listem.contains(widget.dersid)) {
                              setState(() {
                                katildimi = true;
                              });
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return Dialog(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          const Text(
                                            'Uyarı!!',
                                            style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
                                          ),
                                          const SizedBox(
                                            height: 15,
                                          ),
                                          const Text(
                                            'Dersi zaten almışsın.',
                                            style: TextStyle(fontSize: 18),
                                          ),
                                          const SizedBox(
                                            height: 15,
                                          ),
                                          BackButtonView(
                                            title: 'Tamam',
                                            fonk: () {
                                              Get.back();
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              );
                            } else {
                              _firestore
                                  .collection('Person')
                                  .doc(widget.ogretmenid)
                                  .collection('alinacakdersler')
                                  .doc(widget.dersid)
                                  .set({'ders': widget.dersid});
                              _firestore.collection('dersler').doc(widget.dersid).update({'dersalindimi': true});
                              _firestore
                                  .collection('Person')
                                  .doc(authService.infouser())
                                  .collection('alinacakdersler')
                                  .doc(widget.dersid)
                                  .set({
                                'ders': widget.dersid,
                              }).then((value) {
                                return showDialog(
                                  context: context,
                                  builder: (context) {
                                    return Dialog(
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            const Text(
                                              'Ders Alındı',
                                              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
                                            ),
                                            const SizedBox(
                                              height: 15,
                                            ),
                                            const Text(
                                              'Ders kaydın alındı. Derslerim kısmında kayıtlı olduğun dersleri görebilirsin.',
                                              style: TextStyle(fontSize: 18),
                                            ),
                                            const SizedBox(
                                              height: 15,
                                            ),
                                            BackButtonView(
                                              title: 'Tamam',
                                              fonk: () {
                                                print('calisiyo');
                                                Get.to(const HomePage());
                                              },
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                );
                              });
                              setState(() {
                                listem.contains(widget.dersid);
                                katildimi = true;
                              });
                            }
                          }),
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: katildimi
                          ? Text(
                              "Ders Alındı",
                              style: TextStyle(fontSize: Get.width * 0.05, letterSpacing: 2),
                            )
                          : Text(
                              "Derse Katıl",
                              style: TextStyle(fontSize: Get.width * 0.05, letterSpacing: 2),
                            ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
