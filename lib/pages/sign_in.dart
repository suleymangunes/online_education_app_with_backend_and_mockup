import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ogrenciden_canli_egitim_uygulamasi/constants/color_constants.dart';
import 'package:ogrenciden_canli_egitim_uygulamasi/constants/padding_constants.dart';
import 'package:ogrenciden_canli_egitim_uygulamasi/constants/sizedbox_constants.dart';
import 'package:ogrenciden_canli_egitim_uygulamasi/constants/string_detail_constants.dart';
import 'package:ogrenciden_canli_egitim_uygulamasi/pages/forgot_password_page.dart';
import 'package:ogrenciden_canli_egitim_uygulamasi/pages/home_page.dart';
import 'package:ogrenciden_canli_egitim_uygulamasi/pages/register_page.dart';
import 'package:rive/rive.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
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
                  child: TextFormField(
                    controller: _controllerPassword,
                    obscureText: true,
                    enableSuggestions: false,
                    autocorrect: false,
                    style: TextStyle(fontSize: StringDetailConstants.instance.textFieldSize),
                    decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.key_rounded),
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: StringDetailConstants.instance.textFieldSize,
                            vertical: StringDetailConstants.instance.textFieldSize),
                        labelText: "Şifre",
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Şifre boş olamaz";
                      }
                      if (value.length <= 8) {
                        return "Şifre 8 karakterden büyük olmalıdır.";
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(
                  height: SizedboxConstans.instance.spaceSmallBit,
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
                        Get.to(const HomePage());
                      }),
                      child: _butstate
                          ? SizedBox(
                              height: SizedboxConstans.instance.riveHeight,
                              width: SizedboxConstans.instance.riveWidth,
                              child: const RiveAnimation.asset("assets/gifs/loading.riv"))
                          : Padding(
                              padding: PaddingConstants.instance.paddingHorizontalNormal,
                              child: Text(
                                "Giriş Yap",
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Hesabın yok mu?",
                      style: TextStyle(fontSize: StringDetailConstants.instance.textSizeSmall),
                    ),
                    TextButton(
                      onPressed: (() {
                        Get.to(const RegisterPage(), duration: const Duration(milliseconds: 500));
                      }),
                      child: Text(
                        "Hemen Oluştur",
                        style: TextStyle(
                            color: ColorConstants.instance.textColorBlack,
                            fontWeight: StringDetailConstants.instance.textWeightSemiBold,
                            fontSize: StringDetailConstants.instance.textSizeSmall),
                      ),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: (() {
                        Get.to(const ForgotPassword());
                      }),
                      child: Text(
                        "Şifremi Unuttum",
                        style: TextStyle(
                            color: ColorConstants.instance.textColorBlack,
                            fontWeight: StringDetailConstants.instance.textWeightSemiBold,
                            fontSize: StringDetailConstants.instance.textSizeSmall),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
