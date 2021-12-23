import 'package:flutter/material.dart';

import '../../../flutter_error_handling_ui.dart';

Future showUnauthorizedFailureDialog(
  BuildContext context, {
  String? message,
}) {
  return showAlertDialog(
    context,
    title: 'Unauthorized',
    message: message ?? 'You are not authorized to perform this action.',
  );
}
