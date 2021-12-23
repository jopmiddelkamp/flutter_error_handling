import 'package:flutter/material.dart';

import '../../../flutter_error_handling_ui.dart';

Future showUnexpectedFailureDialog(
  BuildContext context, {
  required Exception exception,
  String? message,
}) {
  return showAlertDialog(
    context,
    title: 'Unexpected error',
    message: message ?? 'An unexpected error occurred. Please try again.',
  );
}
