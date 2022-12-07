import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ogrenciden_canli_egitim_uygulamasi/view/lessons_card_design.dart';

class DerslerimPage extends StatefulWidget {
  const DerslerimPage({super.key});

  @override
  State<DerslerimPage> createState() => _DerslerimPageState();
}

class _DerslerimPageState extends State<DerslerimPage> {
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
                  onPressed: (() {}),
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
      body: ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: 10,
          itemBuilder: ((context, index) {
            return const SelectedCardDesign();
          })),
    );
  }
}
