import 'package:flutter/material.dart';
import 'package:ogrenciden_canli_egitim_uygulamasi/constants/color_constants.dart';

class BackButtonView extends StatefulWidget {
  const BackButtonView({super.key, required this.title, required this.fonk});

  final void Function() fonk;
  final String title;
  @override
  State<BackButtonView> createState() => _BackButtonViewState();
}

class _BackButtonViewState extends State<BackButtonView> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
          elevation: MaterialStateProperty.all(3),
          backgroundColor: MaterialStateProperty.all(ColorConstants.instance.hippieGreen),
          shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)))),
      onPressed: (() {
        widget.fonk();
      }),
      child: Padding(
        padding: const EdgeInsets.all(2),
        child: Text(
          widget.title,
          style: const TextStyle(fontSize: 15, letterSpacing: 1),
        ),
      ),
    );
  }
}
