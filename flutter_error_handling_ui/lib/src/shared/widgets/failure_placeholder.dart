import 'package:flutter/material.dart';
import 'package:flutter_error_handling_core/flutter_error_handling_core.dart';

class FailurePlaceholder extends StatelessWidget {
  const FailurePlaceholder(
    this.failure, {
    Key? key,
  }) : super(key: key);

  final Failure failure;

  @override
  Widget build(
    BuildContext context,
  ) {
    return Container(
      width: double.infinity,
      color: _getBackgroundColor(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            _getTitle(),
            style: Theme.of(context).textTheme.headline6!.copyWith(
                  color: _getTextColor(),
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 8),
          Text(
            _getDescription(),
            style: TextStyle(
              color: _getTextColor(),
            ),
          ),
        ],
      ),
    );
  }

  String _getTitle() {
    return failure.when<String>(
      noInternet: () => 'NO_INTERNET',
      notFound: () => '404',
      unauthorized: () => 'UNAUTHORIZED',
      unreachable: () => 'UNREACHABLE',
      unexpected: (_) => 'UNEXPECTED_EXCEPTION',
      forbidden: () => 'FORBIDDEN',
    );
  }

  String _getDescription() {
    return failure.when<String>(
      noInternet: () =>
          'No internet connection, please check your connection and try again.',
      notFound: () => 'The requested resource was not found.',
      unauthorized: () => 'You are not authorized. Please login and try again.',
      unreachable: () => 'The server is unreachable. Please try again later.',
      unexpected: (_) =>
          'An unexpected error has occurred. Please try again later.',
      forbidden: () => 'You are not allowed to perform this action.',
    );
  }

  Color _getBackgroundColor() {
    return failure.when<Color>(
      noInternet: () => Colors.red,
      notFound: () => Colors.red,
      unauthorized: () => Colors.yellow.shade700,
      unreachable: () => Colors.red,
      unexpected: (_) => Colors.red,
      forbidden: () => Colors.yellow.shade700,
    );
  }

  Color _getTextColor() => Colors.white;
}
