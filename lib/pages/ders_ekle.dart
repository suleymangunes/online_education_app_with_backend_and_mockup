import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ogrenciden_canli_egitim_uygulamasi/pages/register_page.dart';
import 'package:rive/rive.dart';

import '../constants/color_constants.dart';
import '../constants/padding_constants.dart';
import '../constants/sizedbox_constants.dart';
import '../constants/string_detail_constants.dart';
import 'forgot_password_page.dart';
import 'home_page.dart';

class DersEkle extends StatefulWidget {
  const DersEkle({super.key});

  @override
  State<DersEkle> createState() => _DersEkleState();
}

class _DersEkleState extends State<DersEkle> {
  final _formkey = GlobalKey<FormState>();
  final TextEditingController _controllerMail = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();
  bool _butstate = false;

  @override
  void dispose() {
    _controllerMail.dispose();
    _controllerPassword.dispose();
    super.dispose();
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
      body: SingleChildScrollView(
        child: Form(
          key: _formkey,
          child: Center(
            child: Column(
              children: [
                // Image.asset("assets/images/ogrenciden_logo_png.png", height: SizedboxConstans.instance.spaceNormal),
                SizedBox(
                  height: SizedboxConstans.instance.spaceNormal * 1.5,
                ),
                SizedBox(
                  width: SizedboxConstans.instance.textFieldNormal,
                  child: TextFormField(
                    controller: _controllerMail,
                    style: TextStyle(fontSize: StringDetailConstants.instance.textFieldSize),
                    decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.school_rounded),
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: StringDetailConstants.instance.textFieldSize,
                            vertical: StringDetailConstants.instance.textFieldSize),
                        labelText: "Ders Adı",
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Ders Adı alanı boş bırakılamaz.";
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(
                  height: SizedboxConstans.instance.spaceSmall * 1.5,
                ),
                SizedBox(
                  width: SizedboxConstans.instance.textFieldNormal,
                  child: TextFormField(
                    keyboardType: TextInputType.multiline,
                    textInputAction: TextInputAction.newline,
                    maxLines: 10,
                    minLines: 3,
                    controller: _controllerPassword,
                    enableSuggestions: false,
                    autocorrect: false,
                    style: TextStyle(fontSize: StringDetailConstants.instance.textFieldSize),
                    decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.content_paste_rounded),
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: StringDetailConstants.instance.textFieldSize,
                            vertical: StringDetailConstants.instance.textFieldSize),
                        labelText: "Ders İçeriği",
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Ders İçeriği boş olamaz";
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(
                  height: SizedboxConstans.instance.spaceSmallBit,
                ),
                Hero(
                  tag: "basla",
                  child: ElevatedButton(
                    style: ButtonStyle(
                        elevation: MaterialStateProperty.all(5),
                        backgroundColor: MaterialStateProperty.all(ColorConstants.instance.hippieGreen),
                        shape:
                            MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)))),
                    onPressed: (() {
                      if (_formkey.currentState!.validate()) {
                        setState(() {
                          _butstate = true;
                        });
                      }
                      setState(() {
                        _butstate = true;
                      });
                      Get.to(const HomePage());
                    }),
                    child: _butstate
                        ? SizedBox(
                            height: SizedboxConstans.instance.riveHeight,
                            width: SizedboxConstans.instance.riveWidth,
                            child: const RiveAnimation.asset("assets/gifs/loading.riv"))
                        : Padding(
                            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                            child: Text(
                              "Ders Ekle",
                              style:
                                  TextStyle(fontSize: StringDetailConstants.instance.buttonBigSize, letterSpacing: 3),
                            ),
                          ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
