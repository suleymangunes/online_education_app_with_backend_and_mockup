import 'package:flutter/material.dart';

class SuccesMessage extends StatefulWidget {
  const SuccesMessage(
      {super.key, required this.message, required this.title, required this.butonText, required this.fonks});

  final String title;
  final String message;
  final String butonText;
  final void Function() fonks;
  @override
  State<SuccesMessage> createState() => _SuccesMessageState();
}

class _SuccesMessageState extends State<SuccesMessage> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(widget.title),
      content: Text(widget.message),
      actions: [
        ElevatedButton(
          onPressed: () {
            widget.fonks();
          },
          child: Text(widget.butonText),
        ),
      ],
    );
  }
}
