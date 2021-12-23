import '../../flutter_error_handling_core.dart';

abstract class UserRepository {
  Future<List<User>> getUsers({
    required int expectedHttpStatus,
  });
}
