import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:ogrenciden_canli_egitim_uygulamasi/constants/sizedbox_constants.dart';
import 'package:ogrenciden_canli_egitim_uygulamasi/pages/forgot_password_check.dart';
import 'package:ogrenciden_canli_egitim_uygulamasi/pages/new_password_page.dart';
import 'package:ogrenciden_canli_egitim_uygulamasi/pages/register_check_page.dart';
import 'package:ogrenciden_canli_egitim_uygulamasi/pages/register_page.dart';
import 'package:rive/rive.dart';

import '../constants/color_constants.dart';
import '../constants/padding_constants.dart';
import '../constants/string_detail_constants.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
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
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Form(
          key: _formkey,
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: SizedboxConstans.instance.spaceBottom,
                ),
                Image.asset("assets/images/ogrenciden_logo_png.png", height: SizedboxConstans.instance.spaceNormal),
                SizedBox(
                  height: SizedboxConstans.instance.spaceNormal,
                ),
                SizedBox(
                  width: SizedboxConstans.instance.textFieldNormal,
                  child: TextFormField(
                    controller: _controllerMail,
                    style: TextStyle(fontSize: StringDetailConstants.instance.textFieldSize),
                    decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.mail_outline_rounded),
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: StringDetailConstants.instance.textFieldSize,
                            vertical: StringDetailConstants.instance.textFieldSize),
                        labelText: "Email",
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Mail alanı boş bırakılamaz.";
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(
                  height: SizedboxConstans.instance.spaceSmall,
                ),
                SizedBox(
                  width: SizedboxConstans.instance.textFieldNormal,
                  child: Hero(
                    tag: "basla",
                    child: ElevatedButton(
                      style: ButtonStyle(
                          elevation: MaterialStateProperty.all(5),
                          backgroundColor: MaterialStateProperty.all(ColorConstants.instance.hippieGreen),
                          shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)))),
                      onPressed: (() {
                        if (_formkey.currentState!.validate()) {
                          setState(() {
                            _butstate = true;
                          });
                        }
                        setState(() {
                          _butstate = true;
                        });
                        Get.to(const ForgotPasswordCheck());
                      }),
                      child: _butstate
                          ? SizedBox(
                              height: SizedboxConstans.instance.riveHeight,
                              width: SizedboxConstans.instance.riveWidth,
                              child: const RiveAnimation.asset("assets/gifs/loading.riv"))
                          : Padding(
                              padding: PaddingConstants.instance.paddingHorizontalNormal,
                              child: Text(
                                "Doğrula",
                                style:
                                    TextStyle(fontSize: StringDetailConstants.instance.buttonBigSize, letterSpacing: 3),
                              ),
                            ),
                    ),
                  ),
                ),
                SizedBox(
                  height: SizedboxConstans.instance.spaceSmall,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
