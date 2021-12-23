import 'package:freezed_annotation/freezed_annotation.dart';

part 'failure.freezed.dart';

@freezed
class Failure with _$Failure implements Exception {
  const factory Failure.noInternet() = NoInternetFailure;
  const factory Failure.notFound() = NotFoundFailure;
  const factory Failure.unauthorized() = UnauthorizedFailure;
  const factory Failure.unreachable() = UnreachableFailure;
  const factory Failure.forbidden() = ForbiddenFailure;
  const factory Failure.unexpected({
    required Exception innerException,
  }) = UnexpectedFailure;
}
