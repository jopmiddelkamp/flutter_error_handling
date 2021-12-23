import 'package:flutter/material.dart';
import 'package:flutter_error_handling_core/flutter_error_handling_core.dart';

import '../../../flutter_error_handling_ui.dart';
import 'no_internet_failure_dialog.dart';

Future showFailureDialog(
  BuildContext context,
  Failure failure,
) {
  return failure.when<Future>(
    noInternet: () => showNoInternetFailureDialog(
      context,
    ),
    notFound: () => showNotFoundFailureDialog(
      context,
    ),
    unauthorized: () => showUnauthorizedFailureDialog(
      context,
    ),
    unreachable: () => showUnreachableFailureDialog(
      context,
    ),
    unexpected: (innerException) => showUnexpectedFailureDialog(
      context,
      exception: innerException,
    ),
    forbidden: () => showForbiddenFailureDialog(
      context,
    ),
  );
}
