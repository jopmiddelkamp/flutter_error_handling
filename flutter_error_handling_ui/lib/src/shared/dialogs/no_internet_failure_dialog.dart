import 'package:flutter/material.dart';

import '../../../flutter_error_handling_ui.dart';

Future showNoInternetFailureDialog(
  BuildContext context, {
  String? message,
}) {
  return showAlertDialog(
    context,
    title: 'No internet connection',
    message: message ?? 'Please check your internet connection and try again.',
  );
}
