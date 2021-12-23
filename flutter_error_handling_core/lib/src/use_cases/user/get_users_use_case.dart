import '../../../flutter_error_handling_core.dart';

class GetUsersUseCase extends UseCase<List<User>, int> {
  GetUsersUseCase({
    required UserRepository userRepository,
  }) : _userRepository = userRepository;

  final UserRepository _userRepository;

  @override
  Future<List<User>> call(
    int param,
  ) async {
    var users = await _userRepository.getUsers(
      expectedHttpStatus: param,
    );
    return users;
  }
}
