import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:ogrenciden_canli_egitim_uygulamasi/constants/color_constants.dart';
import 'package:ogrenciden_canli_egitim_uygulamasi/pages/derslerim.dart';
import 'package:ogrenciden_canli_egitim_uygulamasi/pages/home.dart';
import 'package:ogrenciden_canli_egitim_uygulamasi/pages/profil.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  final screens = [const HomeScreen(), const DerslerimPage(), const Profil()];

  // @override
  // void initState() {
  //   WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
  //     HomePage();
  //   });
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[_selectedIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 5,
              color: Colors.black.withOpacity(.2),
            )
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
            child: GNav(
              rippleColor: Colors.grey[300]!,
              hoverColor: Colors.grey[100]!,
              gap: 5,
              activeColor: ColorConstants.instance.hippieGreenDark,
              iconSize: Get.width * 0.07,
              padding: EdgeInsets.symmetric(horizontal: Get.width * 0.07, vertical: Get.width * 0.03),
              duration: const Duration(milliseconds: 400),
              tabBackgroundColor: ColorConstants.instance.hippieGreenLight2x,
              color: Colors.black54,
              tabs: const [
                GButton(
                  icon: IconData(0xe318, fontFamily: 'MaterialIcons'),
                  text: 'Ana Sayfa',
                ),
                GButton(
                  icon: IconData(0xf8b4, fontFamily: 'MaterialIcons'),
                  text: 'Derslerim',
                ),
                GButton(
                  icon: IconData(0xe491, fontFamily: 'MaterialIcons'),
                  text: 'Profil',
                ),
              ],
              selectedIndex: _selectedIndex,
              onTabChange: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
            ),
          ),
        ),
      ),
    );
  }
}
