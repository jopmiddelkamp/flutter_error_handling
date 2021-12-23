import 'dart:async';

import 'package:flutter_error_handling_core/flutter_error_handling_core.dart';

import '../flutter_error_handling_data.dart';

Future<DataDependencies> bootstrap() async {
  final httpRepository = HttpRepository(
    baseUrl: 'https://httpstat.us',
  );
  return DataDependencies(
    userRepository: SingletonAsync<UserRepository>(
      () async => UserRepositoryImpl(
        httpRepository: httpRepository,
      ),
    ),
  );
}
