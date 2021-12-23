import 'package:flutter/material.dart';

import '../../../flutter_error_handling_ui.dart';

Future showUnreachableFailureDialog(
  BuildContext context, {
  String? message,
}) {
  return showAlertDialog(
    context,
    title: 'Server unreachable',
    message: message ?? 'The server is unreachable. Please try again later.',
  );
}
