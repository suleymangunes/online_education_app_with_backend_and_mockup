import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ogrenciden_canli_egitim_uygulamasi/constants/color_constants.dart';
import 'package:ogrenciden_canli_egitim_uygulamasi/pages/arama_page.dart';
import 'package:ogrenciden_canli_egitim_uygulamasi/pages/ders_ekle.dart';

import '../view/card_design.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<QuerySnapshot<Map<String, dynamic>>> verilerial() async {
    return await _firestore.collection('dersler').where('dersalindimi', isEqualTo: false).get();
  }

  Future? futureveri;

  @override
  void initState() {
    super.initState();
    futureveri = verilerial();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
          toolbarHeight: Get.height * 0.07,
          title: Align(
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  style: ButtonStyle(
                      fixedSize: MaterialStateProperty.all(Size(Get.width * 0.7, Get.height * 0.05)),
                      elevation: MaterialStateProperty.all(3),
                      backgroundColor: MaterialStateProperty.all(Colors.white),
                      shape:
                          MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)))),
                  onPressed: (() {
                    Get.to(const AramaPage());
                  }),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.search,
                        color: Colors.grey,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: Get.width * 0.01),
                        child: const Text(
                          "Search something...",
                          style: TextStyle(color: Colors.grey),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: Get.width * 0.05,
                ),
                Image.asset(
                  "assets/images/ogrenciden_logo_png.png",
                  height: Get.height * 0.05,
                )
              ],
            ),
          )),
      body: FutureBuilder(
        future: futureveri,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              return const Text('hata olustu');
            case ConnectionState.waiting:
              return const Center(child: CircularProgressIndicator());
            case ConnectionState.active:
              return const Center(child: CircularProgressIndicator());

            case ConnectionState.done:
              if (snapshot.hasData) {
                return ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: snapshot.data.docs.length ?? 0,
                  // itemCount: 0,
                  itemBuilder: ((context, index) {
                    return CardDesign(
                      ogretmenisim: snapshot.data.docs[index].data()['ogretmenisim'].toString(),
                      dersicerigi: snapshot.data.docs[index].data()['dersicerigi'].toString(),
                      dersadi: snapshot.data.docs[index].data()['dersadi'].toString(),
                      dersid: snapshot.data.docs[index].data()['dersid'].toString(),
                      ogretmenid: snapshot.data.docs[index].data()['ogretmenid'].toString(),
                    );
                  }),
                );
              } else {
                return const Text('data yok');
              }
          }
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        backgroundColor: ColorConstants.instance.hippieGreenDark,
        onPressed: (() {
          Get.to(const DersEkle());
        }),
        child: Icon(
          Icons.add,
          size: Get.width * 0.07,
        ),
      ),
    );
  }
}
