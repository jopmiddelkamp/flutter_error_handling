import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_error_handling_core/flutter_error_handling_core.dart';

import '../../../flutter_error_handling_ui.dart';

class UsersCubit extends Cubit<UsersState> {
  UsersCubit({
    required UserRepository userRepository,
  })  : _userRepository = userRepository,
        super(const UsersState.loading());

  final UserRepository _userRepository;

  final statusCodes = [
    HttpStatus.accepted,
    HttpStatus.notFound,
    HttpStatus.serviceUnavailable,
    HttpStatus.unauthorized,
    HttpStatus.forbidden,
  ];

  var currentStatusCode = HttpStatus.accepted;

  Future<void> init() => reload();

  Future<void> reload() async {
    await Future.delayed(
      const Duration(milliseconds: 500),
    );
    try {
      final users = await _userRepository.getUsers(
        expectedHttpStatus: currentStatusCode,
      );
      emit(UsersState.loaded(
        users: users,
        statusCodeUsed: currentStatusCode,
      ));
    } on Failure catch (failure) {
      emit(UsersState.failed(
        failure: failure,
      ));
    } finally {
      final index = statusCodes.indexOf(currentStatusCode);
      if (index < statusCodes.length - 1) {
        currentStatusCode = statusCodes[index + 1];
      } else {
        currentStatusCode = statusCodes.first;
      }
    }
  }
}
