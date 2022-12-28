import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ogrenciden_canli_egitim_uygulamasi/alerts/alert_succes.dart';
import 'package:ogrenciden_canli_egitim_uygulamasi/constants/color_constants.dart';
import 'package:ogrenciden_canli_egitim_uygulamasi/constants/sizedbox_constants.dart';
import 'package:ogrenciden_canli_egitim_uygulamasi/alerts/alert_error.dart';
import 'package:ogrenciden_canli_egitim_uygulamasi/pages/sign_in.dart';
import 'package:ogrenciden_canli_egitim_uygulamasi/service/auth_register.dart';
import 'package:rive/rive.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _controllerMail = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();
  final TextEditingController _controllerName = TextEditingController();
  final TextEditingController _controllerPasswordAgain = TextEditingController();

  final _formkey = GlobalKey<FormState>();
  bool _butState = false;

  AuthService authService = AuthService();

  @override
  void dispose() {
    _controllerMail.dispose();
    _controllerName.dispose();
    _controllerPassword.dispose();
    _controllerPasswordAgain.dispose();
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
                  height: Get.height * 0.05,
                ),
                Image.asset("assets/images/ogrenciden_logo_png.png", height: SizedboxConstans.instance.spaceNormal),
                SizedBox(
                  height: Get.height * 0.1,
                ),
                SizedBox(
                  width: Get.width * 0.8,
                  child: TextFormField(
                    controller: _controllerName,
                    style: TextStyle(fontSize: Get.width * 0.04),
                    decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.person),
                        contentPadding: EdgeInsets.symmetric(horizontal: Get.width * 0.04, vertical: Get.width * 0.04),
                        labelText: "İsim Soyisim",
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "İsim alanı boş bırakılamaz.";
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(
                  height: Get.height * 0.02,
                ),
                SizedBox(
                  width: Get.width * 0.8,
                  child: TextFormField(
                    controller: _controllerMail,
                    style: TextStyle(fontSize: Get.width * 0.04),
                    decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.mail_outline_rounded),
                        contentPadding: EdgeInsets.symmetric(horizontal: Get.width * 0.04, vertical: Get.width * 0.04),
                        labelText: "Email",
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Mail alanı boş bırakılamaz.";
                      }
                      if (EmailValidator.validate(value) == false) {
                        return "Lütfen geçerli bir mail girin.";
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(
                  height: Get.height * 0.02,
                ),
                SizedBox(
                  width: Get.width * 0.8,
                  child: TextFormField(
                    controller: _controllerPassword,
                    obscureText: true,
                    enableSuggestions: false,
                    autocorrect: false,
                    style: TextStyle(fontSize: Get.width * 0.04),
                    decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.key_rounded),
                        contentPadding: EdgeInsets.symmetric(horizontal: Get.width * 0.04, vertical: Get.width * 0.04),
                        labelText: "Şifre",
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Şifre boş olamaz";
                      }
                      if (_controllerPassword.text != _controllerPasswordAgain.text) {
                        return "Şifreler aynı olmalıdır.";
                      } else if (value.length <= 8 &&
                          (value.contains(RegExp(r'[A-Z]')) != true) &&
                          (value.contains(RegExp(r'[0-9]')) != true)) {
                        return "• Şifre 8 karakterden büyük olmalıdır.\n• Şifre en az bir büyük harf barındırmalıdır.\n• Şifre en az bir rakam barındırmalıdır.";
                      } else if (value.length <= 8 && (value.contains(RegExp(r'[A-Z]')) != true)) {
                        return "• Şifre 8 karakterden büyük olmalıdır.\n• Şifre en az bir büyük harf barındırmalıdır.";
                      } else if (value.length <= 8 && (value.contains(RegExp(r'[0-9]')) != true)) {
                        return "• Şifre 8 karakterden büyük olmalıdır.\n• Şifre en az bir rakam barındırmalıdır.";
                      } else if ((value.contains(RegExp(r'[A-Z]')) != true) &&
                          (value.contains(RegExp(r'[0-9]')) != true)) {
                        return "• Şifre en az bir büyük harf barındırmalıdır.\n• Şifre en az bir rakam barındırmalıdır.";
                      } else if (value.contains(RegExp(r'[A-Z]')) != true) {
                        return "Şifrede en az bir büyük harf bulunmalıdır.";
                      } else if (value.contains(RegExp(r'[0-9]')) != true) {
                        return "Şifrede en az bir rakam bulunmalıdır.";
                      } else if (value.length <= 8) {
                        return "Şifre 8 karakterden büyük olmalıdır.";
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(
                  height: Get.height * 0.02,
                ),
                SizedBox(
                  width: Get.width * 0.8,
                  child: TextFormField(
                    controller: _controllerPasswordAgain,
                    obscureText: true,
                    enableSuggestions: false,
                    autocorrect: false,
                    style: TextStyle(fontSize: Get.width * 0.04),
                    decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.key_rounded),
                        contentPadding: EdgeInsets.symmetric(horizontal: Get.width * 0.04, vertical: Get.width * 0.04),
                        labelText: "Şifre Tekrar",
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Şifre boş olamaz";
                      }
                      if (_controllerPassword.text != _controllerPasswordAgain.text) {
                        return "Şifreler aynı olmalıdır.";
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(
                  height: Get.height * 0.03,
                ),
                SizedBox(
                  width: Get.width * 0.79,
                  child: Hero(
                    tag: "basla",
                    child: ElevatedButton(
                      style: ButtonStyle(
                          elevation: MaterialStateProperty.all(5),
                          backgroundColor: MaterialStateProperty.all(ColorConstants.instance.hippieGreen),
                          shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)))),
                      onPressed: (() async {
                        if (_formkey.currentState!.validate()) {
                          setState(() {
                            _butState = true;
                          });

                          await authService
                              .createPerson(
                            _controllerName.text,
                            _controllerMail.text,
                            _controllerPassword.text,
                          )
                              .then((value) {
                            Get.offAll(const SignIn());
                            return showDialog(
                              context: context,
                              builder: (context) {
                                return SuccesMessage(
                                  message: 'Kaydolma isleminiz basariyla tamamlanmistir. Giris yapabilirsiniz.',
                                  title: 'Kaydolundu',
                                  butonText: 'Giris Yap',
                                  fonks: () => Get.back(),
                                );
                              },
                            );
                          }).onError((error, stackTrace) {
                            return showDialog(
                              context: context,
                              builder: (context) {
                                return ErrorMessage(
                                  message: error,
                                );
                              },
                            );
                          });
                          setState(() {
                            _butState = false;
                          });
                        }
                      }),
                      child: _butState
                          ? SizedBox(
                              height: Get.height * 0.065,
                              width: 80,
                              child: const RiveAnimation.asset("assets/gifs/loading.riv"),
                            )
                          : Padding(
                              padding: EdgeInsets.symmetric(horizontal: Get.width * 0.04, vertical: Get.width * 0.040),
                              child: Text(
                                "Kaydol",
                                style: TextStyle(fontSize: Get.width * 0.05, letterSpacing: 3),
                              ),
                            ),
                    ),
                  ),
                ),
                SizedBox(
                  height: Get.height * 0.02,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Hesabın var mı?",
                      style: TextStyle(fontSize: Get.width * 0.03),
                    ),
                    TextButton(
                      onPressed: (() {
                        Get.back();
                      }),
                      child: Text(
                        "Hemen Giriş Yap",
                        style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600, fontSize: Get.width * 0.03),
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
