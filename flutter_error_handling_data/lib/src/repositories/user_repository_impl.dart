import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_error_handling_core/flutter_error_handling_core.dart';

import '../../flutter_error_handling_data.dart';

class UserRepositoryImpl extends RepositoryBase implements UserRepository {
  UserRepositoryImpl({
    required HttpRepository httpRepository,
  }) : _http = httpRepository;

  final HttpRepository _http;

  @override
  Future<List<User>> getUsers({
    required int expectedHttpStatus,
  }) async {
    await _http.get<String>(
      expectedHttpStatus.toString(),
    );
    var encodedResult = await rootBundle.loadString(
      'assets/data/users_data.json',
    );
    final json = jsonDecode(encodedResult) as List<dynamic>;
    final result = json.map((json) {
      return User.fromJson(json as Map<String, dynamic>);
    }).toList();
    return result;
  }
}
