import 'dart:async';

import 'package:get_it/get_it.dart';

import '../flutter_error_handling_core.dart';

Future<CoreDependencies> bootstrap() async {
  return CoreDependencies(dependencies: [
    Factory(
      () => GetUsersUseCase(
        userRepository: GetIt.instance(),
      ),
    ),
  ]);
}
