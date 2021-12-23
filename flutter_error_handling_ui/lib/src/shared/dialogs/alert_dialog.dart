import 'package:flutter/material.dart';

Future showAlertDialog(
  BuildContext context, {
  String? title,
  required String message,
}) {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Row(
          children: [
            const Icon(Icons.error),
            const SizedBox(width: 4),
            Text(title ?? 'Alert'),
          ],
        ),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('OK'),
          ),
        ],
      );
    },
  );
}
