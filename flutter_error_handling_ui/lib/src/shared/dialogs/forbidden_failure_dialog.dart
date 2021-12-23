import 'package:flutter/material.dart';

import '../../../flutter_error_handling_ui.dart';

Future showForbiddenFailureDialog(
  BuildContext context, {
  String? message,
}) {
  return showAlertDialog(
    context,
    title: 'Forbidden',
    message: message ?? 'You are not allowed to perform this action.',
  );
}
