import 'package:flutter/material.dart';

import '../../../flutter_error_handling_ui.dart';

Future showNotFoundFailureDialog(
  BuildContext context, {
  String? message,
}) {
  return showAlertDialog(
    context,
    title: 'Not found',
    message: message ?? 'The requested resource was not found.',
  );
}
