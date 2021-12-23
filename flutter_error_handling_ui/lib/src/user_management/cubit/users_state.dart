import 'package:flutter_error_handling_core/flutter_error_handling_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'users_state.freezed.dart';

@freezed
class UsersState with _$UsersState {
  const factory UsersState.loading() = UsersStateLoading;
  const factory UsersState.loaded({
    required List<User> users,
    required int statusCodeUsed,
  }) = UsersStateLoaded;
  const factory UsersState.failed({
    required Failure failure,
  }) = UsersStateFailed;
}
