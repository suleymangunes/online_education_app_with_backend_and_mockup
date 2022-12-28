import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ErrorMessage extends StatefulWidget {
  const ErrorMessage({super.key, required this.message});

  final Object? message;
  @override
  State<ErrorMessage> createState() => _ErrorMessageState();
}

class _ErrorMessageState extends State<ErrorMessage> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.error,
            color: Theme.of(context).colorScheme.error,
          ),
          const SizedBox(
            width: 10,
          ),
          const Text('Hata Olustu!'),
        ],
      ),
      content: Text(widget.message.toString().split('] ')[1]),
      actions: [
        ElevatedButton(
          onPressed: () {
            Get.back();
          },
          child: const Text('Tekrar Dene'),
        ),
      ],
    );
  }
}
