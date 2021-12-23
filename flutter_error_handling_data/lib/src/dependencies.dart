import 'package:flutter_error_handling_core/flutter_error_handling_core.dart';

class DataDependencies {
  const DataDependencies({
    required this.userRepository,
  });

  final SingletonAsync<UserRepository> userRepository;

  void registerAll() {
    userRepository.register();
  }
}
